FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=0

WORKDIR /backend
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV FLASK_APP=manage.py

CMD sh -c "python manage.py migrate && python manage.py seed.db && python manage.py runserver 0.0.0.0:8000"