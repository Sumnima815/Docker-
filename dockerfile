# Use an official Python image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Install uv
RUN pip install uv

# Copy only dependency files first
# This helps Docker cache dependencies
COPY pyproject.toml ./

# If you have a uv.lock file, copy it too
# COPY uv.lock ./

# Install project dependencies
RUN uv sync

# Copy the rest of the application code
COPY . .

# Flask runs on port 5000 by default
EXPOSE 5000

# Command to start the Flask application
CMD ["uv", "run", "python", "app.py"]