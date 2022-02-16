FROM python:3.9.0

WORKDIR /home/

RUN echo "testing..."

RUN git clone https://github.com/BrooklynLee/docker_test.git

WORKDIR /home/docker_test

RUN apt-get update
RUN apt-get install -y tdsodbc unixodbc-dev
RUN apt install unixodbc-bin -y
RUN apt-get clean -y

# # Install pipenv and compilation dependencies
# RUN pip install pipenv
# RUN apt-get update && apt-get install -y --no-install-recommends gcc

RUN pip install -r requirements.txt
RUN pip install gunicorn
RUN pip install mssql-django

# RUN pipenv install --system --deploy

RUN echo "SECRET_KEY=django-insecure-x%2)d$48kl48oegs+d+!2f*q*g14$lr_3q&a2j=3qh1dt$uv0=" > .env
RUN echo "DATABASE_HOSTNAME = 54.92.96.35" > .env
RUN echo "DATABASE_USER = brooklyn" > .env
RUN echo "DATABASE_PASSWORD = gabia4370!@" > .env


# RUN python manage.py migrate
# RUN python manage.py collectstatic --noinput

EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# CMD ["gunicorn", "config.wsgi", "--bind", "0.0.0.0:8000"]
CMD ["bash", "-c", "python manage.py migrate --settings=config.settings.deploy && gunicorn config.wsgi --env DJANGO_SETTINGS_MODULE=config.settings.deploy --bind 0.0.0.0:8000"]

# python manage.py collectstatic --noinput --settings=pragmatic.settings.deploy && 
