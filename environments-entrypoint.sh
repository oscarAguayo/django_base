#!/bin/sh

# Initialize the environments
if [ -z "$(ls -A /compose)" ]; then
	echo "Copy the environments to compose..."
	cp -r /environments/* /compose
fi

exec "$@"