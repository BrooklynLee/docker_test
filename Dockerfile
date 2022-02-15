FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/BrooklynLee/docker_test.git

WORKDIR /home/docker_test

# # Install pipenv and compilation dependencies
# RUN pip install pipenv
# RUN apt-get update && apt-get install -y --no-install-recommends gcc

RUN pip install -r requirements.txt
# RUN pipenv install --system --deploy

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

