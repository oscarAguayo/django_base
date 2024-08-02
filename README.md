# Django Base

Django base configuration to implement in future projects with Django 5.0.x

## Build this image

```shell
docker compose build
```

## How to implement

Inside in an empty folder run the next command:

```shell
wget https://raw.githubusercontent.com/oscarAguayo/django_base/main/start.sh && sudo chmod +x start.sh && bash start.sh && rm -f start.sh
```

Now you can start your containerized django project with:

```shell
docker compose up
```

Change the permission of the `django_<environment>` with the command:

```shell
sudo chown $USER:$USER -R django_<environment>
```

For example:

```shell
sudo chown $USER:$USER -R django_local
```
