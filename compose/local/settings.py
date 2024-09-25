from .base import *


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

##### lOGGING #####
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'simple': {
            'format': '{asctime} {levelname} {message}',
            'style': '{',
        },
    },
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
            'formatter': 'simple',
        },
    },
    'root': {
        'handlers': ['console'],
        'level': 'INFO',
    },
}

##### THIRD CONFIGURATIONS #####

# Debug Toolbar
INTERNAL_IPS = [
    "127.0.0.1",
]
