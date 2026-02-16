#!/bin/bash

# install python package(s)
pip install mariadb

# remove unwanted VSCode extension(s)
sudo code --uninstall-extension eamodio.gitlens

# change default git config to ignore chmod changes and symbolic links
git config core.fileMode false

# change pull to alway rebase to eliminate common git error
git config pull.rebase true

# set up first-run-notice
cp .devcontainer/first-run-notice.txt /workspaces/.codespaces/shared/first-run-notice.txt
