from fastapi import FastAPI
import uvicorn

HOST = '0.0.0.0'
PORT = 3003

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "Me"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: str | None = None):
    return {"item_id": item_id, "q": q}

if (__name__ == '__main__'):
    uvicorn.run(app=app, host=HOST, port=PORT)
