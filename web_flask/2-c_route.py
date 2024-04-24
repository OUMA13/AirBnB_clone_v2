#!/usr/bin/python3
"""script start a Flask web aplct"""
from flask import Flask


app = Flask(__name__)


@app.route("/", strict_slashes=False)
def home():
    return "Hello HBNB!"


@app.route("/hbnb", strict_slashes=False)
def hbnb():
    return "HBNB"


@app.route("/c/<text>", strict_slashes=False)
def text(text):
    return f"C {text.replace('_', ' ')}"


if __name__ == '__main__':
    app.run(host="0.0.0.0", port="5000")
