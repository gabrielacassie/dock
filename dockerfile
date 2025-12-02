# Python base image
FROM python:3.11-slim

# Prevent Python from writing pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install dependencies first
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.python.org/simple/

# Copy project code
COPY . /app/

# Expose port 8000
EXPOSE 8000

# Run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
