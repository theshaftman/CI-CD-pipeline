FROM python:3.13-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Install libraries
RUN pip install --no-cache-dir fastapi uvicorn

# Copy application code
COPY . .

# Expose the backend port
EXPOSE 3003

ENV PYTHONBUFFERED=1

# Run the application
CMD ["python", "app.py"]