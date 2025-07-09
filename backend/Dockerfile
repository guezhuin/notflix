FROM python:3.13.5-alpine3.22

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
    
# Copy the requirements file
COPY requirements/base.txt /app/

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/base.txt && \
    rm /app/base.txt

# Copy the application code
COPY app /app/

# Expose the port the app runs on
EXPOSE 8000

# Set the working directory
WORKDIR /app