
# Motoko/Rust Development Container

This project contains the Dockerfile for the [VS Code development container](https://code.visualstudio.com/docs/remote/containers).

# Install

To use this you have to create a directory `.devcontainer` in your project and add the following two files:

`.devcontainer/devcontainer.json`:

```json
{
 "name": "dfx",
 "build": {
  "dockerfile": "Dockerfile"
 },
 "mounts": [
  "source=${localWorkspaceFolder}/.config/dfx,target=/home/node/.config/dfx,type=bind"
 ],
 "settings": {
  "terminal.integrated.shell.linux": "/bin/bash"
 },
 "extensions": [
  "dbaeumer.vscode-eslint",
  "dfinity-foundation.vscode-motoko"
 ],
 // Use 'forwardPorts' to make a list of ports inside the container available locally.
 // "forwardPorts": [],
 // Use 'postCreateCommand' to run commands after the container is created.
 // "postCreateCommand": "yarn install",
 "remoteUser": "node"
}
```

`.devcontainer/Dockerfile`:

```Dockerfile
FROM f0ide/devcontainer-dfinity

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] run this to upgrade to the latest version of dfx
# RUN yes | dfx upgrade

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# [Optional] Uncomment if you want to install more global node modules
# RUN su node -c "npm install -g <your-package-list-here>"

# [Optional] Uncomment if you want to use Rust
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -t wasm32-unknown-unknown -y
```

## Usage

Install the ["Remote - Containers" extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

Make sure [Docker is installed](https://code.visualstudio.com/docs/remote/containers#_installation),
then run the command `> Remote-Containers: Reopen in container`.

This will download the docker image and setup the development container.

After that you can [open a terminal](https://code.visualstudio.com/docs/editor/integrated-terminal)
and [start developing in Motoko](https://sdk.dfinity.org/docs/developers-guide/tutorials/at-a-glance.html).
