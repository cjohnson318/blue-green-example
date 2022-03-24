# Pull base image
FROM python:3.9.1

ARG SRCROOT

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Update packages
RUN apt update -y && apt upgrade -y 

# Set working directory
WORKDIR /usr/src/app

# Copy project
# COPY src /usr/src/app
COPY ${SRCROOT} /usr/src/app

# Install dependencies
RUN pip install -r requirements.txt
