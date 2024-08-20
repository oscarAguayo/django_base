FROM oaguayo/django_base AS base
ARG APP_ENV
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /django
# RUN mkdir -p /compose/base && mkdir -p /compose/${APP_ENV}
COPY ./compose/base /compose/base
COPY ./compose/${APP_ENV} /compose/${APP_ENV}
COPY ./compose/${APP_ENV} /compose/${APP_ENV}
RUN cp /compose/${APP_ENV}/entrypoint.sh /usr/local/bin/ && chmod +x /usr/local/bin/entrypoint.sh
RUN cd /compose/${APP_ENV} && pip install --no-cache-dir -r requirements.txt && cd /django
# to install requirements in host use `cd ./compose/<APP_ENV> && pip install -r requirements.txt`
# RUN adduser -u 5678 --disabled-password --no-create-home  --gecos "" djangouser && chown -R djangouser /django
# USER djangouser
VOLUME [ "/django" ]
ENTRYPOINT [ "entrypoint.sh" ]

FROM base AS local


FROM base AS development