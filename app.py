from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    """
    Renders the index.html template which contains the Dialogflow Messenger.
    """
    return render_template('index.html')

if __name__ == '__main__':
    # Run the Flask application in debug mode for development.
    # In a production environment, you would use a more robust WSGI server.
    app.run(debug=True)