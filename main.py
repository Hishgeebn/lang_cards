from bottle import Bottle, template, request, redirect, static_file
from bottle_sqlalchemy import SQLAlchemyPlugin
from sqlalchemy import create_engine
from sqlalchemy.orm import joinedload
from models import Base, Language, Word
import os
from dotenv import load_dotenv
from math import ceil

load_dotenv()

url = os.environ.get('DATABASE_URL')
 
engine = create_engine(url)
connection = engine.connect()

app = Bottle()
plugin = SQLAlchemyPlugin(connection, Base.metadata, keyword="db")

app.install(plugin)


@app.route('/static/<filename>')
def static(filename):
    return static_file(filename, root='./static')


@app.get('/')
@app.get('/<page:int>')
def index(db, page=1):
    page_size = 30
    start = (page - 1) * page_size
    langs = db.query(Language).all()
    
    total_words = db.query(Word).filter(Word.language_id.isnot(None)).count()
    total_pages = ceil(total_words / page_size)
    words = (
        db.query(Word)
        .options(joinedload(Word.language))
        .filter(Word.language_id.isnot(None))
        .order_by(Word.id)
        .slice(start, start + page_size)
        .all()
    )
    return template('views/index.tpl', langs=langs, words=words, page=page, total_pages=total_pages)   


@app.post('/add-lang')
def add_lang(db):
    lang = request.forms.get('lang')

    new_lang = Language(name=lang)
    db.add(new_lang)
    db.commit()

    return redirect('/')

@app.post('/add-word')
def add_word(db):
    lang_id = request.forms.get('lang_id')
    word = request.forms.get('word')
    translation = request.forms.get('translation')
    
    language = db.query(Language).filter_by(id=lang_id).first()

    new_word = Word(w_desc=word, translation=translation, language=language)
    db.add(new_word)
    db.commit()

    return redirect('/')


@app.route('/word/<id:int>', methods=['DELETE'])
def delete_word(db, id):
    word = db.query(Word).get(id)
    if word:
        db.delete(word)
        db.commit()
    return redirect('/')


if __name__ == '__main__':
    app.run(host='localhost', port=8080, debug=True, reloader=True)
