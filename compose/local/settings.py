from .base import *

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

ALLOWED_HOSTS = []


# Application definition

LOCAL_APPS = []

THIRD_APPS = ['debug_toolbar',]

INSTALLED_APPS = BASE_APPS + LOCAL_APPS + THIRD_APPS

LOCAL_MIDDLEWARES = []

THIRD_MIDDLEWARES = ['debug_toolbar.middleware.DebugToolbarMiddleware']

MIDDLEWARE = LOCAL_MIDDLEWARES + THIRD_MIDDLEWARES + BASE_MIDDLEWARES

# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

##### THIRD CONFIGURATIONS #####

# Debug Toolbar
INTERNAL_IPS = [
    "127.0.0.1",
]
