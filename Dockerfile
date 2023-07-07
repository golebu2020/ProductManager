FROM python:3.9-slim-bullseye

LABEL maintainer="cgolebu@gmail.com"

ENV PYTHONUNBUFFERED 1

COPY . /app

WORKDIR /app

RUN python -m venv /opt/venv/

RUN /opt/venv/bin/pip install pip --upgrade && \
    /opt/venv/bin/pip install -r requirements.txt && \
    rm -rf requirements.txt && \
    chmod +x entrypoint.sh && \
    adduser && \
        --no-create-home \
        --disabled-password \
        django-user
   

USER django-user

CMD [ "/app/entrypoint.sh" ]