#!/bin/sh

# Start the environments in compose folder
docker run -v ./compose:/compose oaguayo/django_base
sudo chown $USER:$USER -R compose/

echo "Please choose the environment to use [local | development] (default = local):"
read ENVIRONMENT
if [ -z "$ENVIRONMENT" ]; then
	ENVIRONMENT=local
fi
echo "Please write the name of the app:"
read APP_NAME
if [ -z "$APP_NAME" ]; then
	echo "The name of the app can't be empty."
	exit 1
fi
echo "Please write your docker username:"
read DOCKER_USERNAME
if [ -z "$DOCKER_USERNAME" ]; then
	echo "The docker username can't be empty. If you don't have one, create one in https://app.docker.com/signup"
	exit 1
fi

# Verify that the environment exist
dirs=$(ls -d compose/*/)
if [[ "$dirs" == *"compose/$ENVIRONMENT/"* ]]; then
	cp compose/$ENVIRONMENT/.env.example compose/$ENVIRONMENT/.env
	sed -i "s/^APP_NAME=.*/APP_NAME=\"$APP_NAME\"/" compose/$ENVIRONMENT/.env
	sed -i "s/^DOCKER_USERNAME=.*/DOCKER_USERNAME=\"$DOCKER_USERNAME\"/" compose/$ENVIRONMENT/.env
	source compose/$ENVIRONMENT/.env
	bash compose/use_environment.sh $ENVIRONMENT
else
	echo "The specified environment not exist";
fi