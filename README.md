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

Now you can delete all files used for created the new project:

```shell
rm -fr ./compose/apps ./compose/base/settings
```

## VSCODE linter and environment packages

Create a virtual environment out of `src` in the root of project with

```shell
python -m venv venv_<APP_ENV>
```

In local or development environment you can see the var `PYTHONPATH="src"` that will help you tu use linters and local packages in your host machine.

## Git tag with same tag as Docker

To tag the current version on git and push it to cloud use after `git add .` and `git commit -m "..."` `git push origin <branch>` commands.

```shell
source .env
git tag -a "v$TAG" -m "Version $TAG"
git push origin "v$TAG"
```

## Create a new app into container

If you have a `apps_folder` for example `apps` where you put all the apps of project, you need to create first the folder `app_name`

```shell
mkdir -p src/apps/<app_name>
```

And then, create the app inside the container.

```shell
docker compose exec <service_name> python manage.py startapp <app_name> <apps_folder>/<app_name>
```

After create an app don't forget update the permissions in folder:

```shell
sudo chown $USER:$USER -R src
```

Add the app into `setting/<environment>.py` file.

```python
...
LOCAL_APPS = ['apps.<app_name>',]
...
```

And in the `<app_name>/apps.py` edit the `name` variable.

```python
name = 'apps.<app_name>'
```

