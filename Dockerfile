FROM python:3.13-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1

# Install libraries
RUN pip install --no-cache-dir fastapi uvicorn

# Copy application code
COPY . .

RUN useradd --create-home appuser && chown -R appuser:appuser /app
USER appuser

# Expose the backend port
EXPOSE 3003

# Run the application
CMD ["python", "app.py"]