
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export ilogin="kpires"
export repo="git@vogsphere.42paris.fr:vogsphere/intra-uuid-7c33fc40-3c4e-46dc-94df-0d58cf2c1bd3-5294570-kpires"
export workdir="/home/$ilogin/42"
export testerdir="/home/$ilogin/libftTester"
function gsrch(){ xdg-open "https://www.google.com/search?q=$1"; } 
alias intra="xdg-open https://profile.intra.42.fr/"
alias bard="xdg-open https://bard.google.com/chat"
alias friends="xdg-open https://friends42.fr/"
alias cd42="cd $workdir"
function vs42(){ cd $workdir && code . ;  } 
alias rgit="rm -rf $workdir && git clone $repo $workdir"
alias rf="source ~/.zshrc"
alias test="make m -C $testerdir"
alias ftest="make $1 -C $testerdir"