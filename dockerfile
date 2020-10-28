# Use the 20:10 ubuntu image from DockerHub
FROM ubuntu:20.10

# Setting metadata for reference
LABEL maintainer = "scottand" \
      description = "Used to create a standardized notebook container with pandas pre-installed"

# Set the working directory within the container
WORKDIR /app

# Copy the current directory (local) contents into the following container location
COPY . /app

# Installing libraries
RUN pip install -r requirements.txt

# Making port 8888 accessible outside of container for web gui
EXPOSE 8888

# Creating mountpoint so container can copy locally stored data
VOLUME [ "/app/data" ]

# Run jupyter on container startup
CMD [ "jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root" ]