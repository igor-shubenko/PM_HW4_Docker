# syntax=docker/dockerfile:1

FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN chmod +x /app/start_services.sh

RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt &&  \
    pip install "apache-airflow[celery]==2.5.0" --constraint  \
     "https://raw.githubusercontent.com/apache/airflow/constraints-2.5.0/constraints-3.10.txt"

RUN adduser --disabled-password image_user
USER image_user

RUN airflow db upgrade
RUN airflow users create \
          --username airflow \
          --password airflow \
          --firstname FIRST_NAME \
          --lastname LAST_NAME \
          --role Admin \
          --email admin@example.org

EXPOSE 8080/tcp

ENTRYPOINT ["/bin/bash", "-c", "/app/start_services.sh"]

