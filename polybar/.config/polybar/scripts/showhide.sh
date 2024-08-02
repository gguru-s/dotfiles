#!/bin/bash

while [ 1 ]; do
  if [ ! -n "`pgrep -x spotify`" ] ; then
	  echo "inside if"
    polybar-msg action spotify module_hide
#    polybar-msg cmd show.pretzel
  else
	  echo "inside else"
    polybar-msg action spotify module_show
#    polybar-msg cmd hide.pretzel
  fi
  sleep 5s
done
