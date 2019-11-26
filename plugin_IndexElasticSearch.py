import time
import json
import pymongo
from datetime import datetime
from elasticsearch import Elasticsearch

if __name__ == "__main__":

  nomeIndex = input("Qual nome o nome da base de dados:")

  # conectando ao Elastcsearch#
  es = Elasticsearch()

  # conectando ao banco de dados MongoDB#
  mongoDBclient = pymongo.MongoClient("mongodb://localhost:27017/")
  mongoDBdatabase = mongoDBclient[str(nomeIndex)]
  mongoDBCollection = mongoDBdatabase["traffic"]
  mydoc = mongoDBCollection.find()

  i = 1
  for x in mydoc:
    x["_id"] = str("_id")
    mydoc2 = json.dumps(x)
    mydoc2 = mydoc2.replace("_id", "mongo_id") 
    res = es.index(index=str(str(nomeIndex)), doc_type='traffic', id=int(i), body=mydoc2)
    i = i + 1
    
