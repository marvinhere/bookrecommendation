import flask
from sqlalchemy import create_engine
import pandas as pd
import numpy as np
#import operator
import mysql.connector as sql
from flask import request, jsonify
from operations import *
import joblib
import json
import array as arr
import random


from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Create some test data for our catalog in the form of a list of dictionaries.


@app.route('/', methods=['GET'])
def home():
    return '''<h1>Distant Reading Archive</h1>
<p>A prototype API for distant reading of science fiction novels.</p>'''


# A route to return all of the available entries in our catalog.
@app.route('/api/v1/resources/books/all', methods=['GET'])
def api_all():
    return jsonify(books)

@app.route('/transform',methods=['GET'])
def api():
    apikey = request.args.get('apikey')

    if apikey == 'abcd':
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = ''
        MYSQL_HOST_IP = '127.0.0.1'
        MYSQL_PORT = '3306'
        MYSQL_DATABASE = 'srlbcr'
        engine = create_engine('mysql+mysqlconnector://'+MYSQL_USER+':'+MYSQL_PASSWORD+'@'+MYSQL_HOST_IP+':'+MYSQL_PORT+'/'+MYSQL_DATABASE, echo=False)
        dbConnection = engine.connect()
        df = pd.read_sql("SELECT books.id, books.title,books.summary, GROUP_CONCAT(DISTINCT genres.genre SEPARATOR ' ') as genres, GROUP_CONCAT(DISTINCT c_designs.name SEPARATOR ' ') as covers FROM books INNER JOIN book_genres ON book_genres.book_id = books.id INNER JOIN genres ON book_genres.genre_id=genres.id INNER JOIN book_covers ON books.id=book_covers.book_id INNER JOIN c_designs ON book_covers.design_id=c_designs.id GROUP BY books.id", dbConnection)
        df['cover'] = getImportantFeatures(df)
        data = dataVectorized(df['cover'],'array')
        #data = df['cover'].head().to_html()
        joblib.dump(data, "vectorcover.pkl")
        message =['Ok']
        return jsonify(message)
    else:
        message =['Error']
        return jsonify(message)

@app.route('/recommendation',methods=['GET'])
def recommendations():
    apikey = request.args.get('apikey')
    data = request.args.get('data')
    if apikey == 'abcd':
        if data == 'none':
            message = ['Error']
            return jsonify(message)
        else:
            vectorizer = joblib.load("vectorcover.pkl")
            recom = getRecommendations(vectorizer,data,4)
            #random.shuffle(recom)
            ###r = recom.tolist()
            return jsonify(recom)

@app.route('/recommendation-summary',methods=['GET'])
def recomsummary():
    apikey = request.args.get('apikey')
    data = request.args.get('data')
    if apikey == 'abcd':
        if data=='none':
            abort(404)
        else:
            vectorizer = joblib.load("vectorsummary.pkl")
            recom = getRecommendations(vectorizer,data,4)
            #random.shuffle(recom)
            ###r = recom.tolist()
            return jsonify(recom)

@app.route('/transformsummary',methods=['GET'])
def apisummary():
    apikey = request.args.get('apikey')
    if apikey == 'abcd':
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = ''
        MYSQL_HOST_IP = '127.0.0.1'
        MYSQL_PORT = '3306'
        MYSQL_DATABASE = 'srlbcr'
        engine = create_engine('mysql+mysqlconnector://'+MYSQL_USER+':'+MYSQL_PASSWORD+'@'+MYSQL_HOST_IP+':'+MYSQL_PORT+'/'+MYSQL_DATABASE, echo=False)
        dbConnection = engine.connect()
        df = pd.read_sql("SELECT books.id, books.title,books.summary FROM books", dbConnection)
        #df['cover'] = getImportantFeatures(df)
        stop_words = frozenset(["a", "ante","bajo","con","de","desde","durante","hacia","hasta","por","para"])
        #data = dataVectorized(df['summary'],'array')
        data = dataVectorizedSummary(df['summary'],'array',stop_words)
        #data = df['cover'].head().to_html()
        joblib.dump(data, "vectorsummary.pkl")
        message =['Ok']
        return jsonify(message)
    else:
        message =['Error']
        return jsonify(message)


@app.route('/test',methods=['GET'])
def test():
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = ''
        MYSQL_HOST_IP = '127.0.0.1'
        MYSQL_PORT = '3306'
        MYSQL_DATABASE = 'srlbcr'
        engine = create_engine('mysql+mysqlconnector://'+MYSQL_USER+':'+MYSQL_PASSWORD+'@'+MYSQL_HOST_IP+':'+MYSQL_PORT+'/'+MYSQL_DATABASE, echo=False)
        dbConnection = engine.connect()
        df = pd.read_sql("SELECT id, summary FROM books", dbConnection)
        vectorizer = CountVectorizer()
        cm = vectorizer.fit_transform(df['summary'])
        count_vect_df = pd.DataFrame(cm.todense(),columns=cm.get_features_names())
        pd.concat([df,count_vect_df],axis=1)
        return df.to_html()
app.run()