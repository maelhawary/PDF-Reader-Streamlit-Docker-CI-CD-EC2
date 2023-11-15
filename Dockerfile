# Use the official Python image as a base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any dependencies
RUN apt-get update  && pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

#apt-get update  && pip install --upgrade pip && pip3 install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY . .

# Expose the port that Streamlit will run on
EXPOSE 8501

# Command to run your application
#CMD ["streamlit", "run", "app.py"]

#ENTRYPOINT ["streamlit", "run", "app.py"]

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

##To access put localhost:8501 or search for ipconfig and then use IPv4