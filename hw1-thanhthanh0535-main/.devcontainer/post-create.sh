#!/bin/bash

# install python package(s)
pip install mariadb

# remove unwanted VSCode extension(s)
sudo code --uninstall-extension eamodio.gitlens

# change default git config to ignore chmod changes and symbolic links
git config core.fileMode false

# set up sanity check
if test -d .sanity-check
then
    sudo chmod ug+x .sanity-check/sanity.py
    ln -s .sanity-check/sanity.py checkit
fi


# set up first-run-notice
cp .devcontainer/first-run-notice.txt /workspaces/.codespaces/shared/first-run-notice.txt

# load database...try 10 times to deal with potential timing issues
# for n in {1..10}
# do
#     # try the command
#     mysql -u root -e "source .devcontainer/classicmodels.sql"
    
#     # if it succeeds continue
#     if (($? == 0))
#     then
#         break
#     fi

#     # if its the 10th try, give up
#     if (($n == 10))
#     then
#         printf "\n \
# ERROR: timeout waiting for mysql to start\n \
# \n \
# I M P O R T A N T -- Execute the following command from the console:\n \
# \n \
# \tmysql -u root -e \"source .devcontainer/classicmodels.sql\"\n\n"
#         exit 111
#     fi

#     # otherwise wait a couple seconds and try again
#     sleep 2
# done
