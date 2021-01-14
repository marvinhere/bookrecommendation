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
import operator
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from math import*
from sklearn.feature_extraction.text import TfidfVectorizer

 MYSQL_USER = 'root'
        MYSQL_PASSWORD = ''
        MYSQL_HOST_IP = '127.0.0.1'
        MYSQL_PORT = '3306'
        MYSQL_DATABASE = 'srlbcr'
        engine = create_engine('mysql+mysqlconnector://'+MYSQL_USER+':'+MYSQL_PASSWORD+'@'+MYSQL_HOST_IP+':'+MYSQL_PORT+'/'+MYSQL_DATABASE, echo=False)
        dbConnection = engine.connect()
        df = pd.read_sql("SELECT books.id, books.title,books.summary, GROUP_CONCAT(DISTINCT genres.genre SEPARATOR ' ') as genres, GROUP_CONCAT(DISTINCT c_designs.name SEPARATOR ' ') as covers FROM books INNER JOIN book_genres ON book_genres.book_id = books.id INNER JOIN genres ON book_genres.genre_id=genres.id INNER JOIN book_covers ON books.id=book_covers.book_id INNER JOIN c_designs ON book_covers.design_id=c_designs.id GROUP BY books.id", dbConnection)
        df['cover'] = getImportantFeatures(df)
		vectorizer = CountVectorizer()
		cm = vectorizer.fit_transform(cover)
		print(cm)