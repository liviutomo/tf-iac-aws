# pull official base image
FROM python:3.12.0-slim-bookworm

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*


WORKDIR .


RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn password_generator.wsgi:application --bind 0.0.0.0:8000

EXPOSE 8000

