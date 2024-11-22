# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Copy the current directory contents into the container
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8080

# Run the Django development server when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
