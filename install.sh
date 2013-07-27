# Nginx
source nginx.sh

# PostgreSQL
source postgresql.sh

# Node.js
source nodejs.sh

# Create user for deployment. Username will be saved in $DEPLOYER_USERNAME
source user.sh

# rbenv
sudo -H -u $DEPLOYER_USERNAME bash -c "bash rbenv.sh"

# Get to know github.com
sudo -H -u $DEPLOYER_USERNAME bash -c "bash github.sh"
