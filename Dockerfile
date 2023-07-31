# Use a Node.js base image
FROM node:14 as build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install the application's dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React.js application
RUN npm run build

# Stage 2: Use a lightweight web server to serve the built React app
FROM nginx:alpine

# Copy the built React app from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose the default HTTP port
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
