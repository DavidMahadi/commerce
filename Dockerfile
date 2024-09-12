# Base image
FROM python:3.9-slim

# Install system dependencies for building Python packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libffi-dev \
    libcairo2-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
