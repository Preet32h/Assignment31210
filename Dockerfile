FROM python:3.9-slim

WORKDIR /app

# Copy requirements first to leverage Docker cache during builds
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy the rest of the app
COPY . ./

# Expose port 80 for the application
EXPOSE 80

# Install Gunicorn for production
RUN pip install gunicorn

# Start the app with Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]
