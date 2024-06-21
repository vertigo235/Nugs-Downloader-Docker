# Build Nugs-Dl
FROM golang:1.22.4-bullseye as build

WORKDIR /build

# Install dependencies and build the application
RUN apt update && apt install -y --no-install-recommends git ffmpeg && \
    git clone https://github.com/Sorrow446/Nugs-Downloader.git . && \
    go build -o Nugs-DL main.go structs.go

# Final Stage
FROM python:3.12-slim-bullseye
WORKDIR /app
COPY --from=build /build/Nugs-DL /app/Nugs-DL

RUN apt update && apt install -y --no-install-recommends ffmpeg

# Copy the script and make it executable
COPY nugs-dl.sh /app/nugs-dl.sh
RUN chmod +x /app/nugs-dl.sh

# Cleanup
RUN apt clean

# Create a directory for downloads and set permissions
RUN mkdir /downloads && chmod 777 /downloads

# Set the entry point to run the script
ENTRYPOINT ["/app/nugs-dl.sh"]
