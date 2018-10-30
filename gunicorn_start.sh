#!/bin/bash

NAME="django-blog"                              #Name of the application (*)
DJANGODIR=/home/pst/django-blog/project             # Django project directory (*)
SOCKFILE=/home/pst/django-blog/run/gunicorn.sock
USER=pst                                        # the user to run as (*)
GROUP=webdata                                     # the group to run as (*)
NUM_WORKERS=1
DJANGO_SETTINGS_MODULE=project.settings
DJANGO_WSGI_MODULE=project.wsgi                     # WSGI module name (*)

echo "Starting $NAME as `whoami`"

cd $DJANGODIR
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec ../.venv/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user $USER \
  --bind=unix:$SOCKFILE
