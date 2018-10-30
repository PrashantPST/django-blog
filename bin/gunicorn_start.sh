#!/bin/bash

NAME="blog_app"
DJANGODIR=/home/pst/django-blog/project
SOCKFILE=/home/pst/django-blog/run/gunicorn.sock
NUM_WORKERS=9
DJANGO_SETTINGS_MODULE=project.settings
DJANGO_WSGI_MODULE=project.wsgi

echo "Starting $NAME as `whoami`"

cd $DJANGODIR
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec ../.venv/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  -n $NAME \
  -w $NUM_WORKERS \
  -b unix:$SOCKFILE
