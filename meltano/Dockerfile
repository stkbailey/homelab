FROM python:3.8-buster

ENV POETRY_VERSION=1.1.13
RUN mkdir /project
WORKDIR /project

# Copy all files and folders
COPY extract ./extract
COPY load ./load
COPY meltano.yml pyproject.toml poetry.lock ./

# Install poetry to ensure Python dependencies are correct
RUN pip install "poetry==$POETRY_VERSION"
RUN poetry install
RUN poetry run meltano install

# Expose default port used by `meltano ui`
EXPOSE 5000

ENTRYPOINT ["poetry", "run", "meltano"]
