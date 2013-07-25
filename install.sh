# Get latest packages
apt-get -y update

# Install some core stuffs
apt-get -y install curl git-core python-software-properties

# Nginx
add-apt-repository ppa:nginx/stable
apt-get -y update
apt-get -y install nginx
service nginx start

# PostgreSQL
cat > /etc/apt/sources.list.d/pgdg.list << EOF
deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
EOF
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
apt-get -y update
apt-get -y install postgresql libpq-dev
echo "PostgreSQL user:"
read PSQL_USER
createuser $PSQL_USER -P
createdb -O $PSQL_USER $PSQL_USER"_production"

# Telnet and Postfix (sending mails)
apt-get -y install telnet postfix

# Node.js
add-apt-repository ppa:chris-lea/node.js
apt-get -y update
apt-get -y install nodejs

# Create user for deployment
echo "Deployer username:"
read DEPLOYER_USERNAME
adduser $DEPLOYER_USERNAME --ingroup sudo
su $DEPLOYER_USERNAME

# rbenv
curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
export RBENV_ROOT="${HOME}/.rbenv"
mv "${HOME}/.bashrc" "${HOME}/.bashrc_old"
cat > "${HOME}/.bashrc" << EOF
if [ -d "\${RBENV_ROOT}" ]; then
  export PATH="\${RBENV_ROOT}/bin:\${PATH}"
  eval "\$(rbenv init -)"
fi
EOF
cat "${HOME}/.bashrc_old" >> "${HOME}/.bashrc"
rm "${HOME}/.bashrc_old"

cat > "${HOME}/.gemrc" << EOF
---
:verbose: true
:backtrace: false
gem: --no-ri --no-rdoc
EOF

. "${HOME}/.bashrc"
rbenv bootstrap-ubuntu-12-04
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
gem install bundler --no-ri --no-rdoc
rbenv rehash

# Get to know github.com
ssh git@github.com
