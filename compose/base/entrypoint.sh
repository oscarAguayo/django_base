#!/bin/sh

# Create a new Django project if not exist
if [ ! -f manage.py ]; then
	echo "Creating the project..."
	django-admin startproject config .
	echo "Copy environment settings..."
	cp -f /compose/$APP_ENV/settings.py config/settings.py
	mkdir apps

	if [ -n $DJANGO_SUPERUSER_USERNAME ]
	then
		echo "Creating superuser..."
		python manage.py makemigrations
		python manage.py migrate
		python manage.py createsuperuser --username $DJANGO_SUPERUSER_USERNAME --noinput # --email $DJANGO_SUPERUSER_EMAIL # Get values from env vars: https://docs.djangoproject.com/en/5.0/ref/django-admin/#envvar-DJANGO_SUPERUSER_PASSWORD
	fi
else
	echo "Django project already exist..."
fi

exec "$@"