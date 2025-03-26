FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt to the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app

# Expose the port your app is running on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
