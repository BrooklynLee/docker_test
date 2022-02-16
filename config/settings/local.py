
import os
import environ

from pathlib import Path
from .base import *

env = environ.Env(
    # set casting, default value
    DEBUG=(bool, False)
)

# Take environment variables from .env file
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = env('SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

# DATABASE_HOSTNAME = '54.92.96.35'
# DATABASE_USER = 'brooklyn'
# DATABASE_PASSWORD = 'gabia4370!@'
# DRIVER = 'ODBC Driver 17 for SQL Server'

# DATE_INPUT_FORMATS = '%Y-%m-%d'


# # Database
# # https://docs.djangoproject.com/en/1.11/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'NAME': 'UP_INFO_BOARD_DEV',
#         'ENGINE': 'mssql',
#         'HOST': DATABASE_HOSTNAME,
#         'USER': DATABASE_USER,
#         'PASSWORD': DATABASE_PASSWORD,
#         'PORT': 3306,
#         'OPTIONS': {
#             'isolation_level': 'READ UNCOMMITTED'
#         },
#     }
# }