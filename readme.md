# Dockerized Nugs-Downloader

This Docker image allows you to run the Nugs-Downloader application in a containerized environment. It provides flexibility in configuring user and group IDs, as well as customizing the application's settings using environment variables.

## Usage

1. Build the Docker image:

docker build -t nugs-downloader .

2. Create a .env file with your environment variables, e.g., config.env:

NUGS_EMAIL=youremail@email.com
NUGS_PASSWORD=your_password
NUGS_FORMAT=4
NUGS_VIDEO_FORMAT=5
NUGS_OUT_PATH=/downloads
NUGS_TOKEN=
NUGS_USE_FFMPEG_ENV_VAR=true
PUID=1000
PGID=1000

Customize the values to your requirements.

3. Run the Docker container, passing in the environment variable file:

docker run --env-file config.env -v /your/host/downloads:/downloads nugs-downloader

Replace /your/host/downloads with the host path where you want to store downloaded files.

## Environment Variables

- NUGS_EMAIL: Your email address.
- NUGS_PASSWORD: Your password.
- NUGS_FORMAT: Format value (default: 4).
- NUGS_VIDEO_FORMAT: Video format value (default: 5).
- NUGS_OUT_PATH: Output path for downloads (default: "/downloads").
- NUGS_TOKEN: Your token (leave empty if not needed).
- NUGS_USE_FFMPEG_ENV_VAR: Use Ffmpeg environment variable (default: true).
- PUID: User ID for the app user (default: 1000).
- PGID: Group ID for the app group (default: 1000).

## Customizing User and Group IDs

You can customize the user and group IDs (PUID and PGID) by setting them in the .env file. This allows you to match the container's user and group with those on your host system, ensuring proper file permissions.

## Configuration

You can configure the application settings by modifying the .env file. These settings will be used when running the container.

## License

This Docker image is provided under the MIT License.
