#!/bin/sh

# Initialize the environments
if [ -z "$(ls -A /compose)" ]; then
	cp -r /environments/* /compose
fi

exec "$@"