#!/bin/sh

# Run base entrypoint.sh AND delete /compose folder
bash /compose/base/entrypoint.sh && rm -fr /compose

# entrypoint.sh of environment
python manage.py runserver 0.0.0.0:$DJANGO_PORT --settings=config.settings.$APP_ENV

exec "$@"