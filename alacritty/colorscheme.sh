#!/usr/bin/env bash
# https://shuheikagawa.com/blog/2020/02/14/switching-colorschemes-of-vim-and-alacritty/

dotfiles=~/dotfiles
alacritty=${dotfiles}/alacritty


configure_alacritty() {
  color=$1
  cat "${alacritty}/base.yml" "${alacritty}/${color}.yml" > ~/.alacritty.yml
}

configure_vim() {
  echo "$1" > ~/.vim/colors/color.vim
}

usage() {
    echo USAGE
    exit 1
}

err() {
    exit_code="$1"
    err_message="$2"
    echo "ERR: $err_message"
    exit "$exit_code"
}

main() {

    alacritty_color=-
    vim_color=-

    # process arguments
    while [[ $# -gt 0 ]]
    do
        case "$1" in
            # *:* )
            #
            # # WAITFORIT_hostport=(${1//:/ })
            # IFS=':' read -r -a WAITFORIT_hostport <<< "$1"
            #
            # WAITFORIT_HOST=${WAITFORIT_hostport[0]}
            # WAITFORIT_PORT=${WAITFORIT_hostport[1]}
            # shift 1
            # ;;
            # --child)
            # WAITFORIT_CHILD=1
            # shift 1
            # ;;
            # -q | --quiet)
            # WAITFORIT_QUIET=1
            # shift 1
            # ;;
            # -s | --strict)
            # WAITFORIT_STRICT=1
            # shift 1
            # ;;
            # -h)
            # WAITFORIT_HOST="$2"
            # if [[ $WAITFORIT_HOST == "" ]]; then break; fi
            # shift 2
            # ;;
            # --host=*)
            # WAITFORIT_HOST="${1#*=}"
            # shift 1
            # ;;
            --ala)
                ext="yml"
                dir="${alacritty}"

                color="$2"
                if [[ $color == "" ]]; then 
                    err 1 "$1 must be followed by colorscheme name" 
                fi
                if [[ $color == -* ]]; then 
                    err 1 "$1 must be followed by colorscheme name, not option like '$color'" 
                fi
                # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash/965072#965072
                color=$(basename -- "$color")
                if [[ "${color##*.}" == "$ext" ]]; then
                    color="${color%.*}"
                fi

                # ext=".yml"
                if [[ ! -e "${dir}/${color}.$ext" ]]; then
                    colors="$(find "${dir}" -name "*$ext" -exec basename {} \; | sed 's/\.[^.]*$//' | grep -v color | sort)"
                    err 1 "unknown $kind color $color, available colors:\\n%s\\n" "${colors[*]}" 
                fi

                alacritty_color="$color"
                shift 2
            ;;
            --vim)
                ext="yml"

                color="$2"
                if [[ $color == "" ]]; then 
                    err "$1 must be followed by colorscheme name"
                    exit 1
                fi
                if [[ $color == -* ]]; then 
                    err "$1 must be followed by colorscheme name, not option like '$color'"
                fi
                # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash/965072#965072
                color=$(basename -- "$color")
                if [[ "${color##*.}" == "$ext" ]]; then
                    color="${color%.*}"
                fi

                vim_color="$color"
                shift 2
            ;;
            # --port=*)
            # WAITFORIT_PORT="${1#*=}"
            # shift 1
            # ;;
            # -t)
            # WAITFORIT_TIMEOUT="$2"
            # if [[ $WAITFORIT_TIMEOUT == "" ]]; then break; fi
            # shift 2
            # ;;
            # --timeout=*)
            # WAITFORIT_TIMEOUT="${1#*=}"
            # shift 1
            # ;;
            # --)
            # shift
            # WAITFORIT_CLI=("$@")
            # break
            # ;;
            --help)
                usage
            ;;
            *)
                echoerr "Unknown argument: $1"
                usage
            ;;
        esac
    done

    echo TODO
    return 0

    alacritty_color=$1
    vim_color=$2
    if [[ $vim_color == "" ]]; then
        vim_color="$alacritty_color"
    fi
    if [[ $alacritty_color == "" ]]; then
        echo "color must be specifed"
        return 1
    fi

    kind="alacritty"
    color="$alacritty_color"
    dir="${alacritty}"
    ext=".yml"
    if [[ $color != "-" && ! -e "${dir}/${color}$ext" ]]; then
        colors="$(find "${dir}" -name "*$ext" -exec basename {} \; | sed 's/\.[^.]*$//' | grep -v color | sort)"
        printf "ERR: unknown $kind color $color, available colors:\\n%s\\n" "${colors[*]}"
        return 1
    fi

    kind="vim"
    color="$vim_color"
    dir="${dotfiles}/vim/bundle/vim-colorschemes/colors"
    ext=".vim"
    if [[ $color != "-" && ! -e "${dir}/${color}$ext" ]]; then
        colors="$(find "${dir}" -name "*$ext" -exec basename {} \; | sed 's/\.[^.]*$//' | grep -v color | sort)"
        printf "ERR: unknown $kind color $color, available colors:\\n%s\\n" "${colors[*]}"
    fi

    if [[ $alacritty_color != "-" ]]; then
        configure_alacritty "$alacritty_color"
    fi
    if [[ $vim_color != "-" ]]; then
        configure_vim "colorscheme $vim_color"
    fi
    echo "OK: alacritty color is set to '$alacritty_color', vim color is set to '$vim_color'"
}
main "$@"
