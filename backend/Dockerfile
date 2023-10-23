# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install server-side dependencies
RUN npm install

# Copy the rest of the server-side application code to the container
COPY . .

# Expose the server port
EXPOSE 5000

# Start the Node.js server
CMD ["node", "index.js"]

