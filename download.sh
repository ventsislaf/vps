# Get latest packages
apt-get -y update

# Install some basic packages
apt-get -y install curl git-core python-software-properties telnet postfix

# clone the repository
git clone git@github.com:vencislaf/vps.git

# run install.sh
cd vps
source install.sh
