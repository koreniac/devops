# Define a base image for the container
FROM node:lts-alpine3.17

# Set the working directory
WORKDIR /app

# Copy the Node.js application to the container
COPY . .

# Install the dependencies required to run the Node.js application
RUN npm install --production


ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
# Expose the port used by the application
EXPOSE 3000
EXPOSE 8125/udp

# Define the command to run the Node.js application based on environment variables
CMD if [ "$NODE_ENV" = "production" ]; \
    then \
        npm  run start; \
    else \
         if [ "$NODE_ENV" = "dev" ]; \
        then \
           npm run start-dev; \
        else \
            npm run test; \
        fi \
    fi
