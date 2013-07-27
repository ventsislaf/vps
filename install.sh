# Nginx
source nginx.sh

# PostgreSQL
source postgresql.sh

# Node.js
source nodejs.sh

# Create user for deployment. Username will be saved in $DEPLOYER_USERNAME
source user.sh

# rbenv
su - $DEPLOYER_USERNAME -c rbenv.sh

# Get to know github.com
su - $DEPLOYER_USERNAME -c github.sh
