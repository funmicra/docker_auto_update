# Base image
FROM python:3.12-slim

# Environment settings
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Working directory
WORKDIR /app

# Copy application files
COPY docker_auto_update.py .
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
  
# Expose Docker socket to the container
VOLUME ["/var/run/docker.sock"]

# Default command
CMD ["python", "docker_auto_update.py"]