#!/usr/bin/env bash
# https://shuheikagawa.com/blog/2020/02/14/switching-colorschemes-of-vim-and-alacritty/

dotfiles=~/dotfiles
alacritty=${dotfiles}/alacritty


configure_alacritty() {
  color=$1
  cat "${alacritty}/base.yml" "${alacritty}/${color}.yml" > "${dotfiles}/alacritty.yml"
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

    alacritty_color=

    # process arguments
    while [[ $# -gt 0 ]]
    do
        case "$1" in
            --help)
                usage
            ;;
            *)
                if [[ $alacritty_color != "" ]]; then
                    err 1 "\$color ($alacritty_color) can not be set twice"
                fi
                ext="yml"
                dir="${alacritty}"

                color="$1"
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
                shift 1
            ;;
        esac
    done

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

    if [[ $alacritty_color != "-" ]]; then
        configure_alacritty "$alacritty_color"
    fi
    echo "OK: alacritty color is set to '$alacritty_color'"
}
main "$@"
