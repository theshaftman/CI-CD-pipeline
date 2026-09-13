FROM python:3.13-slim

RUN mkdir -p ~/.projects/ci_cd_pipeline/app
WORKDIR ~/.projecs/ci_cd_pipeline/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Install libraries
RUN pip install --no-cache-dir fastapi && \
    pip install --no-cache-dir uvicorn

# Copy application code
COPY . .

# Expose the backend port
EXPOSE 3003

ENV PYTHONBUFFERED=1

# Run the application
CMD ["sh", "-c", "python app.py"]