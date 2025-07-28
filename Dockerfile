# Use a slim Python base image for a smaller final image size
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
# This step is cached as long as requirements.txt doesn't change, speeding up subsequent builds
COPY requirements.txt .
COPY static/ /app/static/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
# The .dockerignore (next step) will exclude unnecessary files
COPY . .

# Expose the port that Gunicorn will listen on
#EXPOSE 5000

# Command to run the application using Gunicorn
# 'app:app' means the 'app' Flask instance from the 'app.py' module
# You can adjust the number of workers based on your server's CPU cores
#CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]