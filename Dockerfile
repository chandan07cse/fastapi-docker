# Dockerfile
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the FastAPI app code
COPY . ./app

# Run FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0",CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]]