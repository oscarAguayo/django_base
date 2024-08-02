FROM oaguayo/django_base AS base
ARG APP_ENV
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /django
COPY ./compose/${APP_ENV}/requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN rm -f requirements.txt
COPY ./compose/${APP_ENV}/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
VOLUME [ "/django" ]
ENTRYPOINT [ "entrypoint.sh" ]

FROM base AS local


FROM base AS development