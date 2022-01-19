FROM python:3.9

RUN apt-get install && apt update

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/usr/src/
WORKDIR /usr/src/

RUN pip install pipenv

COPY Pipfile Pipfile.lock ./
RUN pipenv install --ignore-pipfile --system --deploy

COPY . ./

CMD ./manage.py makemigrations && ./manage.py migrate && ./manage.py runserver 0.0.0.0:8000