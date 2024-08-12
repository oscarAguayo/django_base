FROM oaguayo/django_base AS base
ARG APP_ENV
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /django
COPY ./compose/${APP_ENV}/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN pip install --no-cache-dir -r /compose/${APP_ENV}/requirements.txt
# RUN adduser -u 5678 --disabled-password --no-create-home  --gecos "" djangouser && chown -R djangouser /django
# USER djangouser
VOLUME [ "/django" ]
ENTRYPOINT [ "entrypoint.sh" ]

FROM base AS local


FROM base AS development