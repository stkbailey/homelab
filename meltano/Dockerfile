FROM python:3.8-buster

RUN mkdir /project
WORKDIR /project
RUN pip install poetry

# Install all plugins into the `.meltano` directory
COPY extract/* load/* meltano.yml pyproject.toml poetry.lock ./
RUN poetry install
RUN meltano install

# Pin `discovery.yml` manifest by copying cached version to project root
RUN cp -n .meltano/cache/discovery.yml . 2>/dev/null || :

# Don't allow changes to containerized project files
ENV MELTANO_PROJECT_READONLY 1

# Expose default port used by `meltano ui`
EXPOSE 5000

ENTRYPOINT ["meltano"]
