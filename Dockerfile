FROM python:3.12-slim-bookworm
RUN apt update
WORKDIR /compose
COPY ./compose .
RUN chmod +x /compose/use_environment.sh
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /compose/base/requirements.txt
