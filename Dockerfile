FROM python:3.7-alpine
LABEL maintainer="aadnekar"

ENV PYTHONUNBEFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# For security purposes we create a user for with only run access
# (-D), and change to that user instead of the root user which has
# access to all commands.
RUN adduser -D user
USER user