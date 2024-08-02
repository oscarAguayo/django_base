#!/bin/sh

# Initialize the project if not exist
if [ ! -f manage.py ]; then
	echo "Starting the project..."
	django-admin startproject config .
	cp -f /compose/$APP_ENV/settings.py config/settings.py
fi

python manage.py runserver 0.0.0.0:$DJANGO_PORT

exec "$@"