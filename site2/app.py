import os
import uvicorn
from typing import Union
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    try:
        print(os.environ['PORT'])
    except:
        print("PORT not found")
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    try:
        print(os.environ['PORT'])
    except:
        print("PORT not found")
    return {"item_id": item_id, "q": q}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=int(os.getenv('PORT')))

# pip install fastapi
# pip install uvicorn
# uvicorn app:app --reload
# http://127.0.0.1:8000
# http://127.0.0.1:8000/items/5?q=somequery
# pip install pipreqs
# pipreqs
# pip show uvicorn
