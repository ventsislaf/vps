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
