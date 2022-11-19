#!/bin/bash
source /venv/bin/activate
cd /app

echo "----- Collect static files ------ " 
python3 manage.py collectstatic --noinput

echo "-----------Apply migration--------- "
python3 manage.py makemigrations 
python3 manage.py migrate

echo "-----------Run gunicorn--------- "
gunicorn -b :5000 stocks.wsgi:application