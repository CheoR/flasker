from flask import Flask

# app = Flask(__name__)


# @app.route("/")
# def hello():
#     return "Hello World!"


# if __name__ == '__main__':
#     app.run(debug=True, host='0.0.0.0', port=5000)


def create_app(test_config=None):
    # create and configure the app
    # print(f"__name__: {__name__}") # src
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        debug=True,
        host='0.0.0.0',
        port=5000,
    )

    @app.route('/')
    def hello():
        return 'Moo Pug!'

    return app
