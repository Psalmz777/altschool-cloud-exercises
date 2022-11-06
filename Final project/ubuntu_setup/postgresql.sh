#!/usr/bin/bash
# Create the file repository :
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt -y update

# Install the latest version of PostgreSQL package along with a -contrib package:
sudo apt -y install postgresql postgresql-contrib

# Start PostgreSQL daemon 
sudo systemctl start postgresql.service

# Create a new postgres user 
sudo -u postgres createuser --samantha
sudo -i -u postgres psql -c "CREATE USER samantha WITH ENCRYPTED PASSWORD 'samantha2022'"

# Create a new database  
sudo -i -u postgres psql -c "CREATE DATABASE samanthadb WITH ENCODING 'UTF8' TEMPLATE template0"

# Grant samantha user privilege on the samanthadb database
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE samanthadb to samantha"

# Configure user login method in pg_hba.conf
echo -e 'local\tall\t\tsamantha\t\t\t\tmd5' >>/etc/postgresql/15/main/pg_hba.conf

# Restart the PostgreSQL daemon
systemctl restart postgresql
