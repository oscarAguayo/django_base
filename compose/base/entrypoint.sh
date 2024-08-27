#!/bin/sh

# Copy settings files if not exist
copy_setting_environment_file(){
	if [ ! -f ./config/settings/$APP_ENV.py ]; then
		echo "Copy environment settings file..."
		cp -f /compose/$APP_ENV/settings.py ./config/settings/$APP_ENV.py
	else
		echo "Environment settings file already exist..."
	fi
}


# Create a new Django project if not exist
if [ ! -f manage.py ]; then
	echo "Creating the project..."
	django-admin startproject config .
	echo "Removing default settings.py file..."
	rm -f config/settings.py
	echo "Copy settings folder..."
	cp -fr /compose/base/settings ./config/
	copy_setting_environment_file
	echo "Copy apps folder..."
	cp -fr /compose/apps ./

	if [ -n "${DJANGO_SUPERUSER_EMAIL:-}" ]
	then
		echo "Creating superuser..."
		python manage.py makemigrations --settings=config.settings.$APP_ENV
		python manage.py migrate --settings=config.settings.$APP_ENV
		python manage.py createsuperuser --email $DJANGO_SUPERUSER_EMAIL --noinput --settings=config.settings.$APP_ENV # Get values from env vars: https://docs.djangoproject.com/en/5.0/ref/django-admin/#envvar-DJANGO_SUPERUSER_PASSWORD
	else
		echo "DJANGO_SUPERUSER_EMAIL is not set, create it manually..."
	fi
else
	echo "Django project already exist..."
fi

copy_setting_environment_file

exec "$@"