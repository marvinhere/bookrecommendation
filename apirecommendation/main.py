import flask
from sqlalchemy import create_engine
import pandas as pd
import numpy as np
#import operator
import mysql.connector as sql
from flask import request, jsonify
#from operations import *
import joblib
import json
import array as arr
import random
import sys
import recommendations as recommend
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
app = flask.Flask(__name__)
app.config["DEBUG"] = False

# Create some test data for our catalog in the form of a list of dictionaries.


@app.route('/', methods=['GET'])
def home():
    return '''<h1>Distant Reading Archive</h1>
<p></p>'''


# A route to return all of the available entries in our catalog.
@app.route('/api/v1/resources/books/all', methods=['GET'])
def api_all():
    return jsonify(books)

@app.route('/transform-cover',methods=['GET'])
def api():
    apikey = request.args.get('apikey')
    #api password
    if apikey == 'abcd':
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = ''
        MYSQL_HOST_IP = '127.0.0.1'
        MYSQL_PORT = '3306'
        MYSQL_DATABASE = 'srlbcr'
        engine = create_engine('mysql+mysqlconnector://'+MYSQL_USER+':'+MYSQL_PASSWORD+'@'+MYSQL_HOST_IP+':'+MYSQL_PORT+'/'+MYSQL_DATABASE, echo=False)
        dbConnection = engine.connect()
        df = pd.read_sql("SELECT books.id, books.title,books.summary, GROUP_CONCAT(DISTINCT genres.genre SEPARATOR ' ') as genres, GROUP_CONCAT(DISTINCT c_designs.name SEPARATOR ' ') as covers FROM books INNER JOIN book_genres ON book_genres.book_id = books.id INNER JOIN genres ON book_genres.genre_id=genres.id INNER JOIN book_covers ON books.id=book_covers.book_id INNER JOIN c_designs ON book_covers.design_id=c_designs.id GROUP BY books.id", dbConnection)
        df['cover'] = recommend.getImportantFeatures(df)
        data = recommend.dataVectorized(df['cover'])
        list = df[['id']].to_dict()
        joblib.dump(data, "vector-cover.pkl")
        joblib.dump(list['id'],"ids.pkl")
        message =['Ok']
        return jsonify(list["id"])
    else:
        message =['Error']
        return jsonify(message)

@app.route('/recommendation-cover',methods=['GET'])
def recommendations():
    apikey = request.args.get('apikey')
    data_test_id = request.args.get('data')
    k =  request.args.get('k')
    #data_test_id es el id a analizar
    if apikey == 'abcd':
        #obtener datos de entrenamiento de archivo vector-cover
        train_data = joblib.load("vector-cover.pkl")
        #obtener ids de archivo ids
        ids_data = joblib.load("ids.pkl")
        recom = recommend.getRecommendations(ids_data,train_data,data_test_id,int(k))
        return jsonify(recom)

@app.route('/recommendation-summary',methods=['GET'])
def recomsummary():
    apikey = request.args.get('apikey')
    data_test_id = request.args.get('data')
    k = request.args.get('k')
    if apikey == 'abcd':
        if data_test_id=='none':
            abort(404)
        else:
            vectorizer = joblib.load("vector-summary.pkl")
            ids_data = joblib.load("ids.pkl")
            recom = recommend.getRecommendations(ids_data,vectorizer,data_test_id,int(k))
            return jsonify(recom)

@app.route('/transform-summary',methods=['GET'])
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
        data = recommend.dataVectorizedSummary(df['summary'],stop_words)
        #data = df['cover'].head().to_html()
        joblib.dump(data, "vector-summary.pkl")
        message =['Ok']
        return jsonify(message)
    else:
        message =['Error']
        return jsonify(message)

app.run(host='0.0.0.0', port=5000)
