#!/usr/bin/env bash
# https://shuheikagawa.com/blog/2020/02/14/switching-colorschemes-of-vim-and-alacritty/

dotfiles=~/dotfiles
alacritty=${dotfiles}/alacritty


configure_alacritty() {
  color=$1
  cat ${alacritty}/base.yml ${alacritty}/${color}.yml > ~/.alacritty.yml
}

configure_vim() {
  echo $1 > ~/.vim/colors/color.vim
}

main() {
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
    if [[ ! -e "${dir}/${color}.yml" ]]; then
        colors="$(find "${dir}" -name '*.yml' -exec basename {} \; | sed 's/\.[^.]*$//' | grep -v color | sort)"
        colors=$(echo $colors[@])
        printf "ERR: unknown $kind color $color, available colors:\n${colors[@]}\n"
        return 1
    fi

    kind="vim"
    color="$vim_color"
    dir="${dotfiles}/vim/bundle/vim-colorschemes/colors"
    if [[ ! -e "${dotfiles}/vim/bundle/vim-colorschemes/colors/${color}.vim" ]]; then
        colors="$(find ${dotfiles}/vim/bundle/vim-colorschemes/colors/ -name '*.vim' -exec basename {} \; | sed 's/\.[^.]*$//' | grep -v color | sort)"
        colors=$(echo $colors[@])
        printf "ERR: unknown $kind color $color, available colors:\n${colors[@]}\n"
    fi

    configure_alacritty $alacritty_color
    configure_vim "colorscheme $vim_color"
    echo "OK: alacritty color is set to '$alacritty_color', vim color is set to '$vim_color'"
}
main "$@"
