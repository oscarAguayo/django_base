#!/bin/sh

# For first time, Run base entrypoint.sh AND then delete /compose folder
if [ -d /compose ]; then
	bash /compose/base/entrypoint.sh && rm -fr /compose
fi

# entrypoint.sh of environment
python manage.py runserver 0.0.0.0:$DJANGO_PORT

exec "$@"