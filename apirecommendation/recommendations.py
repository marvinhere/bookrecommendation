import operator
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from math import*
from sklearn.feature_extraction.text import TfidfVectorizer
import pandas as pd
import array as arr

#Concatenar informacion del cover
def getImportantFeatures(data):
    important_features = []
    for i in range(0,data.shape[0]):
        important_features.append(data['title'][i]+' '+data['genres'][i]+ ' '+data['covers'][i])
    return important_features
#Convertir cada data en vectores
def dataVectorized(data):
    vectorizer = CountVectorizer()
    cm = vectorizer.fit_transform(data)
    datarray = cm.toarray()
    return datarray
#Convertir cada data del resumen en vectores
def dataVectorizedSummary(data,stopwords):
    vectorizer = TfidfVectorizer(stop_words=stopwords)
    cm = vectorizer.fit_transform(data)
    datarray = cm.toarray()
    return datarray

#Algoritmo de distancia utilizado en knn
def __euclideanDistance(x,y):
    return sqrt(sum(pow(a-b,2) for a, b in zip(x,y)))
#Modificacion del algoritmo knn, No clasifica, solo ordena por distancias
def __vecinos(ids,traindata,tdata,k):
    testdata = tdata
    distances = {}
    id_list={}
    for x in range(len(traindata)):
        dist = __euclideanDistance(testdata,traindata[x])
        distances[ids[x]] = float(dist)
    newdistances = sorted(distances.items(), key=lambda x:x[1])
    neighbors = list(newdistances)[:k]
    return neighbors

#funcion que obtiene las recomendaciones
def getRecommendations(ids,traindata,data,k):
    recom = None    
    #testdata = traindata[int(data)-1]
    keyId = list(ids.keys())[list(ids.values()).index(int(data))]
    testdata = traindata[keyId]
    #recom = getNeighbors(traindata,testdata,k)
    recom = __vecinos(ids,traindata,testdata,k)
    return recom