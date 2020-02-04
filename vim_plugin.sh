#!/usr/bin/env bash
CMD=$1
PLUGINS_DIR="$(dirname "$0")/vim/pack/plugins/start"
if [[ $CMD == "add" ]]; then
    URL=$2
    if curl --output /dev/null --silent --head --fail "$URL"; then
        # git submodule init
        NAME=$3
        if [[ $NAME == "" ]]; then
            NAME=$(basename "$URL")
        fi
        if ! [[ $NAME =~ ^[0-9a-zA-Z_-]+$ ]]; then
            echo ERROR: invalid plugin name"'$NAME'"
            exit 1
        fi
        DIR_PATH="$PLUGINS_DIR/$NAME"
        git submodule add "$URL" "$DIR_PATH" && echo OK: added "'$NAME'" from URL"'$URL'" to "'$DIR_PATH'"
    else
        echo URL"'$URL'" does not exist
    fi
elif [[ $CMD == "rm" ]]; then
    NAME=$2
    DIR_PATH="$PLUGINS_DIR/$NAME"
    if [[ -d $DIR_PATH ]]; then
        git submodule deinit -f "$DIR_PATH"
        git rm -f "$DIR_PATH"
        rm -Rf ".git/modules/$DIR_PATH"
        echo OK: deleted plugin"'$NAME'" from "'$DIR_PATH'"
    else
        echo ERROR: plugin"'$NAME'" is not found at "'$DIR_PATH'" 
        exit 1
    fi
elif [[ $CMD == "ls" ]]; then
    ls -A "$PLUGINS_DIR"
elif [[ $CMD == "dir" ]]; then
    echo "$PLUGINS_DIR"
elif [[ $CMD == "help" ]]; then
    echo USAGE: 
    echo "   $0 add URL [NAME]"
    echo "       adds plugin'NAME' from URL"
    echo "       NAME=\$(basename URL), by default"
    echo "   $0 rm NAME"
    echo "       removes plugin'NAME'"
    echo "   $0 ls"
    echo "       lists all plugins in PLUGINS_DIR"
    echo "   $0 dir"
    echo "       prints PLUGINS_DIR"
elif [[ $CMD == "" ]]; then
    echo ERROR: "$0" expects CMD
    exit 1
else
    echo ERROR: unexpectd CMD"'$CMD'"
    exit 1
fi
