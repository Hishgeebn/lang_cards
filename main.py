from bottle import Bottle, template, request, redirect, static_file
from bottle_sqlalchemy import SQLAlchemyPlugin
from sqlalchemy import create_engine
from models import Base, Language
import os
from dotenv import load_dotenv

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


@app.get('/no')
def index():
    return template('views/noname.tpl')


@app.get('/')
def index(db):
    langs = db.query(Language).all()
    error = request.query.get('error')
    return template('views/index.tpl', langs=langs, error=error)


@app.post('/add-lang')
def add_lang(db):
    lang = request.forms.get('lang')

    new_lang = Language(name=lang)
    db.add(new_lang)
    db.commit()

    return redirect('/')


if __name__ == '__main__':
    app.run(host='localhost', port=8080, debug=True, reloader=True)
