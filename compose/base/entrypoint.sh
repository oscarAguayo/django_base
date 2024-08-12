#!/bin/sh

# Initialize the project if not exist
if [ ! -f manage.py ]; then
	echo "Starting the project..."
	django-admin startproject config .
	echo "Copy environment settings..."
	cp -f /compose/$APP_ENV/settings.py config/settings.py

	if [ -n $DJANGO_SUPERUSER_USERNAME ]
	then
		echo "Creating superuser..."
		python manage.py makemigrations
		python manage.py migrate
		python manage.py createsuperuser --username $DJANGO_SUPERUSER_USERNAME --no-input --email $DJANGO_SUPERUSER_EMAIL # Get values from env vars: https://docs.djangoproject.com/en/5.0/ref/django-admin/#envvar-DJANGO_SUPERUSER_PASSWORD
	fi

fi

exec "$@"