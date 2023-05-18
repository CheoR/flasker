FROM python:3-alpine3.10

RUN pip install pipenv

ENV PROJECT_DIR /app

COPY . /${PROJECT_DIR}
WORKDIR ${PROJECT_DIR}

RUN pipenv install --system --deploy

# CMD ["python3", "./src/main.py"]
# CMD ["flask"]
# CMD ["flask", "--app", "./src", "run", "--debug"]
# CMD ["flask", "--app", "./app", "run", "--debug"]
# CMD ["python3", "src"]
# CMD ["python3", "./src/__init__.py"]

EXPOSE 5000

