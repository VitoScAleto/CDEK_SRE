FROM python:3.10-slim

EXPOSE 8000 

WORKDIR /CDEK

COPY Python/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY Python/main.py .


CMD ["fastapi", "dev", "--host", "0.0.0.0", "--port", "8000"]
