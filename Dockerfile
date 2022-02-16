FROM python:3.9.0

WORKDIR /home/

RUN echo "testing12345"

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
# RUN pipenv install --system --deploy

RUN echo "SECRET_KEY=django-insecure-x%2)d$48kl48oegs+d+!2f*q*g14$lr_3q&a2j=3qh1dt$uv0=" > .env

RUN python manage.py migrate
# RUN python manage.py collectstatic --noinput

EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
CMD ["gunicorn", "config.wsgi", "--bind", "0.0.0.0:8000"]

