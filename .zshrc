export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh


export ilogin="login"
export repo="REPO"

export workdir="/home/$ilogin/42"
export subject="https://cdn.intra.42.fr/pdf/pdf/105472/fr.subject.pdf"

#tester dir
export fripdir="/home/$ilogin/tester/tripouille"
export unitdir="/home/$ilogin/tester/unit-tests"
export wardir="/home/$ilogin/tester/libftwar"

function gsrch(){ xdg-open "https://www.google.com/search?q=$1"; }

alias intra="xdg-open https://profile.intra.42.fr/"
alias subject="xdg-open $subject"
alias bard="xdg-open https://bard.google.com/chat"
alias friends="xdg-open https://friends42.fr/"
alias spotify="xdg-open https://open.spotify.com/collection/tracks"
alias cd42="cd $workdir"
function vs42(){ cd $workdir && code . ;  } 
alias rgit="rm -rf $workdir && git clone $repo $workdir"
alias rf="source ~/.zshrc"
alias zshrc="cd ~/ && code .zshrc"
alias gcw="gcc -Wall -Wextra -Werror $1"

function libfttest() {
    export libft=$PWD
    LAST_DIR=$PWD
    # FRIPOUILLE
    if [[ -n $1 ]]; then
    export libft=$1
    make m -C $fripdir
    if [[ $1 != 0 ]]; then
        echo "Error: Failed to make directory '$1'."
    fi
    else
    make m -C $fripdir
    if [[ $? != 0 ]]; then
        echo "Error: Failed to make directory '$fripdir'."
    fi
    fi
    #UNIT TEST
    make so -C $libft
    make bonus -C $libft
    read -s -k '?Press any key to continue with UnitTest';
    cp $libft/libft.so $unitdir
    cd $unitdir && ./run_test
    rm $libft/libft.so
    rm $unitdir/libft.so
    cd $LAST_DIR

    #LIBFTWAR
    read -s -k '?Press any key to continue with LibftWAR';
    bash $wardir/grademe.sh;
}

function libftftest() {
    export libft=$PWD
    LAST_DIR=$PWD

    #FRIPOUILLE
    make $1 -C $fripdir;
    sleep 1
    make fclean -C $libft

    #UNIT TEST
    read -s -k '?Press any key to continue with Unit-tests -> ' $1;
    make all bonus so -C $libft
    sleep 1
    cp $libft/libft.so $unitdir
    cd $unitdir && ./run_test $1
    sleep 1
    rm $libft/libft.so
    rm $unitdir/libft.so
    make fclean -C $libft
    cd $LAST_DIR

    #LIBFTWAR
    read -s -k '?Press any key to continue with LibftWAR -> ' $1;
    bash $wardir/grademe.sh ft_$1;
    
}
