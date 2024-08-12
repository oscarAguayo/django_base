#!/bin/sh

bash /compose/base/entrypoint.sh

python manage.py runserver 0.0.0.0:$DJANGO_PORT

exec "$@"