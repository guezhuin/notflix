FROM python:3.13.5-alpine3.22

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apk add --no-cache ca-certificates

# Copy company certificates
COPY certificates/ /usr/local/share/ca-certificates/

# Update CA certificates
RUN update-ca-certificates
    
# Install additional dependencies
RUN apk add --no-cache postgresql-client
    
# Copy the requirements file
COPY requirements/base.txt /app/

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/base.txt

# Set the working directory
WORKDIR /app

# Copy the application code
COPY backend/ /app/

# Expose the port the app runs on
EXPOSE 8000
