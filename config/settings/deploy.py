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
DEBUG = False

ALLOWED_HOSTS = ['*']

DATABASE_HOSTNAME = env('DATABASE_HOSTNAME')
DATABASE_USER = env('DATABASE_USER')
DATABASE_PASSWORD =  env('DATABASE_PASSWORD')
DRIVER = 'ODBC Driver 17 for SQL Server'

DATE_INPUT_FORMATS = '%Y-%m-%d'


# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {
    'default': {
        'NAME': 'UP_INFO_BOARD_DEV',
        'ENGINE': 'mssql',
        'HOST': DATABASE_HOSTNAME,
        'USER': DATABASE_USER,
        'PASSWORD': DATABASE_PASSWORD,
        'PORT': 3306,
        'OPTIONS': {
            'isolation_level': 'READ UNCOMMITTED'
        },
    }
}
