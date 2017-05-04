#!/bin/bash
# Author: xnum
# Email: xnumtw@gmail.com
# Date: 2017/5/4


REAL_HOME=$(cat /etc/passwd | grep $USER | awk -F ':' '{ print $6 }')
WORK_DIR="$REAL_HOME/.xnws"

load_ws() {
    if [ ! -d "$WORK_DIR/$1" ] ; then
        echo "Error: workspace [$1] is not exists"
        return
    fi

    export ORIG_PS1="$PS1"
    export PS1="[$1] $PS1"
    export HOME="$WORK_DIR/$1"

    rsync -auq --exclude ".xnws" $REAL_HOME/.* $HOME
    cd ~
}

exit_ws() {
    export PS1=$ORIG_PS1
    export HOME=$REAL_HOME
    cd ~
}

create_ws() {
    if [ ! -d $WORK_DIR ] ; then
        mkdir $WORK_DIR
    fi

    if [ ! -d "$WORK_DIR/$1" ] ; then
        mkdir $WORK_DIR/$1
    fi

    load_ws $1
}

usage() {
    echo "usage: chh (new|load|exit|ls) [name]"
    echo "\tnew [name]"
    echo "\tload [name]"
    echo "\rls"
    echo "\texit"
}

case "$1" in
new)
    if [ $# -ne 2 ]; then
        usage
    else
        create_ws $2
    fi
    ;;

load)
    if [ "$REAL_HOME" != "$HOME" ] ; then
        echo "Error: You are at virtual home"
    else
        if [ $# -ne 2 ]; then
            usage
        else
            load_ws $2
        fi
    fi
    ;;

exit)
    if [ "$REAL_HOME" = "$HOME" ] ; then
        echo "Error: You are at real home"
    else
        exit_ws
    fi
    ;;

ls)
    ls -1 $WORK_DIE
    ;;
*)
    usage

    ;;
esac

