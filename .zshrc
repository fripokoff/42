export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh


export ilogin="kpires"
export repo="git@vogsphere.42paris.fr:vogsphere/intra-uuid-7c33fc40-3c4e-46dc-94df-0d58cf2c1bd3-5294570-kpires"

export workdir="/home/$login/42"
export libft="/home/$ilogin/42/projects/libft"
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
alias cd42="cd $workdir"
function vs42(){ cd $workdir && code . ;  } 
alias rgit="rm -rf $workdir && git clone $repo $workdir"
alias rf="source ~/.zshrc"
alias zshrc="cd ~/ && code .zshrc"
alias gcw="gcc -Wall -Wextra -Werror $1"

function test() {
    LAST_DIR=$PWD

    #FRIPOUILLE
    make m -C $fripdir;

    #UNIT TEST
    make so -C $libft
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

function ftest() {
    LAST_DIR=$PWD

    #FRIPOUILLE
    make $1 -C $fripdir;

    #UNIT TEST
    make so -C $libft
    read -s -k '?Press any key to continue with Unit-tests -> ' $1;
    cp $libft/libft.so $unitdir
    cd $unitdir && ./run_test $1
    rm $libft/libft.so
    rm $unitdir/libft.so
    cd $LAST_DIR

    #LIBFTWAR
    read -s -k '?Press any key to continue with LibftWAR -> ' $1;
    bash $wardir/grademe.sh ft_$1;
    
}