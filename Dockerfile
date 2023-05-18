# FROM python:3-alpine3.10
FROM python:3.10

# ENV PATH $PATH:$HOME/.local/bin
ENV PROJECT_DIR /app
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
# ENV PYTHONUNBUFFERED=1

# Set the environment variable for Flask
ENV FLASK_APP=app/__init__.py

ENV PIPENV_VENV_IN_PROJECT=1

COPY . /${PROJECT_DIR}

WORKDIR ${PROJECT_DIR}

RUN pip install pipenv # --user
RUN pipenv install --system --deploy --ignore-pipfile

COPY . .

# RUN useradd -m appuser
# USER appuser

EXPOSE 5000


# Creates a non-root user and adds permission to access the /app folder
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /appUSER appuser

# Run the Flask application when the container starts
CMD ["pipenv", "run", "flask", "run", "--host=0.0.0.0"]

