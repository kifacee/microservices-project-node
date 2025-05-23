# Use an official Node.js image from the Docker Hub
FROM node:12-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies inside the container. needed for dotenv
RUN npm install

# Copy the rest of your application code into the container
COPY . .

# Copy the wait-for.sh script into the container
COPY wait-for.sh /wait-for.sh

# Make sure it's executable
RUN chmod +x /wait-for.sh

# Expose the app port (you can adjust this depending on your setup)
EXPOSE 8080

#CMD is handled in the .yml file
