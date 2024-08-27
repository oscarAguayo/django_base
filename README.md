# Django Base

Django base configuration to implement in future projects with Django 5.0.x

## Build this image

```shell
docker compose build --no-cache --push
```

## How to implement

Inside in the folder project run the next command:

```shell
wget https://raw.githubusercontent.com/oscarAguayo/django_base/main/start.sh && sudo chmod +x start.sh && bash start.sh && rm -f start.sh
```

You can change any configuration inside `.env` file in the root project or even in the `docker-compose.yml` file.

Now you can start your containerized django project with:

```shell
docker compose up
```

Change the permission of the `src` with the command:

```shell
sudo chown $USER:$USER -R src
```

## VSCODE linter and environment packages

Create a virtual environment out of `src` in the root of project with

```shell
python -m venv venv_<APP_ENV>
```

In local or development environment you can see the var `PYTHONPATH="src"` that will help you tu use linters and local packages in your host machine.
