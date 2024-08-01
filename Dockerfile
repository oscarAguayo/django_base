FROM python:3.12-slim-bookworm
RUN apt update
WORKDIR /compose
COPY environments /environments
RUN chmod +x /environments/use_environment.sh
COPY environments-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/environments-entrypoint.sh
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN rm -f requirements.txt
VOLUME [ "/compose"]
ENTRYPOINT [ "environments-entrypoint.sh" ]
