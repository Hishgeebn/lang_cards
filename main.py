from bottle import Bottle, template

app = Bottle()


# @app.route('/static/<filename>')
# def static(filename):
#     return static_file(filename, root='/static')


@app.route('/<name>')
def hello(name='real'):
    return template('views/index.tpl', name=name)


if __name__ == '__main__':
    app.run(host='localhost', port=8080, debug=True)

# pip freeze > requirements.txt
