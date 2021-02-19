import logging

import azure.functions as func
from pymongo import MongoClient
from bson.json_util import dumps


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    uri = "mongodb://caper:ElT8nHTJe3p1iilLllrqE6Do4nvqrMgFlU3bDQhUrBJTUhzSEr3CD5do0RqrzO0BJ2wXPOX9PXrY69hAhe0l5w==@caper.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@caper@"
    client = MongoClient(uri)
    db = client['db-one']
    collection = db['collection-two']
    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    if name:
        return func.HttpResponse(f"Hello, {name}. This HTTP triggered function executed successfully.")
    else:
        return func.HttpResponse(
            #  "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
            #  status_code=200
             dumps(list(collection.find())),
        )
