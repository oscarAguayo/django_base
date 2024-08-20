#!/bin/sh

# Run base entrypoint.sh
bash /compose/base/entrypoint.sh

# Delete compose folder
echo "Delete /compose folder..."
rm -fr /compose

# entrypoint.sh of environment
python manage.py runserver 0.0.0.0:$DJANGO_PORT

exec "$@"