### The first instruction sets the base image for the container, 
### while the second instruction creates a named stage for performing build steps in a multi-stage build.
### The choice between these two instructions depends on your specific requirements and the structure of your Dockerfile.
#
# Stage 1
# FROM cirrusci/flutter:stable AS build
FROM ghcr.io/cirruslabs/flutter:3.16.2 AS build

### Copying the files to the /app/ directory and setting it as the working directory.
#
RUN mkdir /app/
COPY ./smarttelecom/ /app/
WORKDIR /app/
### This command provides detailed information about the Flutter installation, environment, and any missing dependencies.
### And it helps ensure that the necessary tools and configurations are in place for building Flutter applications.
#
RUN flutter doctor -v
### This command enables web support in the Flutter SDK. 
### It configures the Flutter environment to include web-specific libraries and dependencies required for building Flutter web applications.
#
RUN flutter config --enable-web
### This command builds the Flutter web application in release mode. 
### It generates the necessary files and assets for running the application on the web. 
### The --web-renderer=auto flag allows Flutter to automatically choose the appropriate web renderer (HTML or Canvas) based on the platform and browser capabilities.
#

RUN flutter build web --no-tree-shake-icons --release --web-renderer=html --base-href /web/

# Stage 2
FROM nginx:latest
COPY --from=build /app/build/web /usr/share/nginx/html