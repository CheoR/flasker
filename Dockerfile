FROM python:3-alpine3.10

RUN pip install pipenv

ENV PROJECT_DIR /app

COPY . /${PROJECT_DIR}
WORKDIR ${PROJECT_DIR}

RUN pipenv install --system --deploy

CMD ["python", "./src/main.py"]

EXPOSE 5000

