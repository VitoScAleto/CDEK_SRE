from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

app = FastAPI()

metrics = {
    "request": 0,
    "errors": 0
}

@app.get("/")
async def check_status_server():
    metrics["request"] +=1
    return PlainTextResponse("OK")

@app.get("/metrics", response_class=PlainTextResponse)
async def get_metrics():
    metrics["request"] +=1
    return f"""# HELP http_requests_total Total requests
# TYPE http_requests_total counter
http_requests_total {metrics['request']}
# HELP http_errors_total Total errors
# TYPE http_errors_total counter
http_errors_total {metrics['errors']}"""