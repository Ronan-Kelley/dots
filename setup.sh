#!/bin/sh

install_programs() {
    # install paru
    if [ ! $(command -v paru) ]; then
        sudo pacman -S --needed base-devel git
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        cd ..
    fi
    # install from programs.list
    programs=()
    old_IFS=$IFS
    IFS=$'\n'
    for program in $(cat programs.list); do
        programs+="${program//[$'\t\r\n']} "
    done
    IFS=$old_IFS
    echo "about to run command 'paru -S --needed ${programs[*]}' - continue (Y/N)?"
    read userin
    if [ "$userin" = "y" ] || [ "$userin" = "Y" ]; then
        paru -S --needed ${programs[*]}
    fi
    # run post-install script if it exists
    [ -f post-programs.sh ] && ./post-programs.sh
}

print_help() {
    echo "usage: ./setup.sh [programs] [dotfiles] [help]"
    echo "programs: install paru if needed, use it to install the programs in programs.list, then run post-programs.sh"
    echo "help: print this help message"
}

main() {
    for arg in $*; do
        case "$arg" in
            programs) install_programs
            ;;
            help | -h | --help) print_help
            ;;
            *) echo "unrecognized argument \"$arg\""
            ;;
        esac
    done
}

main $*
