# Django Base

Django base configuration to implement in future projects with Django 5.0.x

## How to implement

### Build image

```shell
docker compose build
```


## ENV Vars

All the environment vars examples are in `compose/example_environment/env.example`. The variables used in this django_base container are:

* `DJANGO_SECRET_KEY` - Django secret key for project
* `APP_ENV` - App environment to use in project only `"production"` value disable the `DEBUG` variable. **This name need to be the same in folder inside in compose folder.** For example, if you want to use `development` you need to create a folder inside `compose` with the `development` name, and inside of it create all the files `Dockerfile`, `requirements.txt`, `settings.py` and `docker-compose.yml` to use in the django project.

