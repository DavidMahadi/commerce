# Use a specific version of the Python image to ensure consistency
FROM python:3.9-slim

# Set environment variables to avoid writing .pyc files and to buffer output
ENV PYTHONUNBUFFERED=1

# Create and set the working directory
WORKDIR /app

# Copy only the requirements file to leverage Docker cache for dependencies
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port on which the application will run
EXPOSE 9000

# Define the command to run the application (adjust if using a different entry point)
CMD ["python", "manage.py", "runserver", "0.0.0.0:9000"]
