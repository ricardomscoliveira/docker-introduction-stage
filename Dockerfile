# Use an official Node.js runtime as a parent image
FROM node:20-alpine3.17


# Install PostgreSQL client and tini
RUN apk add --update postgresql-client tini

# Create and set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Install and enable pg_trgm extension in PostgreSQL
RUN apk add --no-cache postgresql-contrib

# Expose the port your app runs on
EXPOSE 3000

# Define the command to run your application
CMD ["node", "app.js"]