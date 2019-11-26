import time
import json
import pymongo
import sys
import io


def storegeDB(item, mongoDBCollection):
  registerJSON = json.loads(item)
  mongoDBCollection.insert_one(registerJSON)

def readFile(fileLog, mongoDBCollection):
  while True:
    where = fileLog.tell()
    line = fileLog.readline()
    if not line:
      time.sleep(1)
      fileLog.seek(where)
    else:
      storegeDB(str(line), mongoDBCollection)

if __name__ == "__main__":

  nomeIndex = input("Qual nome o nome da base de dados:")
  
  # conectando ao banco de dados #
  mongoDBclient = pymongo.MongoClient("mongodb://localhost:27017/")
  mongoDBdatabase = mongoDBclient[nomeIndex]
  mongoDBCollection = mongoDBdatabase["traffic"]

  # abrindo o arquivo de log escrito pelo coletor #
  fileLog = open(sys.argv[1], "r", encoding="utf-8")

  readFile(fileLog, mongoDBCollection)

  # fexando o arquivo de log escrito pelo coletor #
  fileLog.close
