#!/bin/bash

if [ "$1" = "help" ] || [ "$1" = "-h" ] || [ "$1" = "-help" ];
then
    ruby main.rb help
elif [ "$1" = "demo" ];
then
    ruby main.rb demo
else
    ruby main.rb
fi

