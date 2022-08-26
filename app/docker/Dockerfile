FROM --platform=linux/x86_64 python:3.10.5-slim-buster

RUN mkdir -p /app/
COPY app/src /app/
WORKDIR /app/

RUN pip install --upgrade pip
RUN pip install requests==2.28.1

ENTRYPOINT ["python", "/app/main.py"]