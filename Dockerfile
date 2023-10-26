FROM python:3.9.12

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN pip install --no-cache-dir -r requirements.txt

RUN python manage.py makemigrations
RUN python manage.py migrate

RUN chmod 777 -R /usr/src/app

ENTRYPOINT [ "/usr/src/app/docker-entrypoint.sh" ]
EXPOSE 8000