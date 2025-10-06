FROM python:3.13-alpine3.22 AS venv_builder

# Install system dependencies, including those for compiling lingo and Python dev files
RUN pip install --upgrade pip 
RUN apk add --update --no-cache --virtual .tmp-build-deps git gcc g++ libc-dev make cmake python3-dev zlib-dev curl bash openjdk17-jre

# Install Lingua Franca compiler (lfc)
RUN curl -Ls https://install.lf-lang.org | bash -s cli
ENV PATH="/root/.local/bin:${PATH}"

# ICE Frost dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Copy the configuration files and data models
COPY src /app/src
COPY frost /app/frost
COPY resources /app/resources

WORKDIR /app

CMD ["/bin/sh"]