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

def getImportantFeatures(data):
    important_features = []
    for i in range(0,data.shape[0]):
        important_features.append(data['title'][i]+' '+data['genres'][i]+ ' '+data['covers'][i])
    return important_features

def dataVectorized(data,type):
    vectorizer = CountVectorizer()
    cm = vectorizer.fit_transform(data)
    datarray = ''
    if type == 'array':
        datarray = cm.toarray()
    if type == 'vectorizer':
        datarray = cm
    return datarray

def dataVectorizedSummary(data,type,stopwords):
    vectorizer = TfidfVectorizer(stop_words=stopwords)
    cm = vectorizer.fit_transform(data)
    datarray = ''
    if type == 'array':
        datarray = cm.toarray()
    if type == 'vectorizer':
        datarray = cm
    return datarray

def euclideanDistance(x,y):
    return sqrt(sum(pow(a-b,2) for a, b in zip(x,y)))

def getNeighbors(trainingSet, testInstance, k):
    distances = []
    length = len(testInstance)-1
    for x in range(len(trainingSet)):
        dist = euclideanDistance(testInstance,trainingSet[x])
        distances.append((trainingSet[x],dist))
    distances.sort(key=operator.itemgetter(1))
    neighbors = []
    for x in range(k):
        neighbors.append(distances[x][0])
    return neighbors

def vecinos(traindata,tdata,k):
    testdata = tdata
    distances = {}
    for x in range(len(traindata)):
        dist = euclideanDistance(testdata,traindata[x])
        distances[x] = float(dist)
    newdistances = sorted(distances.items(), key=lambda x:x[1])
    neighbors = {}
    for x in range(k):
       neighbors[x] = newdistances[x]
    return neighbors

def getRecommendations(traindata,data,k):
    recom = None    
    testdata = traindata[int(data)-1]
    #recom = getNeighbors(traindata,testdata,k)
    recom = vecinos(traindata,testdata,k)
    return recom

def getResponse(neighbors):
    classVotes = {}
    for x in range(len(neighbors)):
        response = neighbors[x][-1]
        if response in classVotes:
            classVotes[response]+=1
        else:
            classVotes[response] = 1
    sortedVotes = sorted(classVotes.iteritems(),key=operator.itemgetter(1),reverse=True)
    return sortedVotes[0][0]