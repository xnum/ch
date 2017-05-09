#!/usr/bin/env bash

REAL_HOME=$(cat /etc/passwd | grep $USER | awk -F ':' '{ print $6 }')

if [ ! -d "$REAL_HOME/.bin" ] ; then
    mkdir -p $REAL_HOME/.bin
fi

if [ ! -e "ch.sh" ] ; then
    echo "Error: ch.sh not fonud."
    exit 0
fi

cp ch.sh $REAL_HOME/.bin/

if [ -f "$REAL_HOME/.bashrc" ] ; then
    echo "alias ch='source $REAL_HOME/.bin/ch.sh'" >> $REAL_HOME/.bashrc
fi

if [ -f "$REAL_HOME/.zshrc" ] ; then
    echo "alias ch='source $REAL_HOME/.bin/ch.sh'" >> $REAL_HOME/.zshrc
fi
