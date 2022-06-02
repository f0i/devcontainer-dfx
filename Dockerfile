# See here for image contents: https://github.com/f0i/devcontainer-dfinity

# [Choice] Node.js version: 16, 14, 12
ARG VARIANT="18"
FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:0-${VARIANT}

# Add testing to have current enough glibc version
RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential

# install dfinity sdk
RUN yes | sh -ci "$(curl -fsSL https://sdk.dfinity.org/install.sh)" && chmod +x `which dfx`

# create parent directory for dfx config
RUN su node -c "mkdir -p /home/node/.config"

# make sure it's working
RUN su node -c "dfx --version"
