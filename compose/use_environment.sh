#!/bin/sh

# How to use:
# bash use_environment.sh <environment>
# or
# bash path/to/compose/use_environment.sh <environment>
# environments = [local, development, production, etc...]
# For example:
# bash compose/use_environment.sh "development"

# NOTES: you need to create the folder with files for each environment

if [ -z "$1" ]; then
	echo 'Specify the environment: bash compose/use_environment.sh "local"'
	exit 1
fi

# Get the path where script is
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"
dirs=$(ls -d */)

if [[ "$dirs" == *"$1/"* ]]; then
	# Define the destination path
	DEST_DIR="$DIR/../"

	# Change to destination path
	cd "$DEST_DIR"

	# Create simbolic link to docker-compose.yml file
	if [ -f "$DIR/$1/docker-compose.yml" ]; then
		ln -sf "$DIR/$1/docker-compose.yml" "./docker-compose.yml"
	else
		echo "The file: $DIR/$1/docker-compose.yml not exist."
	fi
	# Create simbolic link to .env file
	if [ -f "$DIR/$1/.env" ]; then
		ln -sf "$DIR/$1/.env" "./.env"
	else
		echo "The file: $DIR/$1/.env not exist."
	fi
else
	echo "The specified environment not exist";
fi
