# Path to your oh-my-zsh installation.
export EDITOR='vim'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias hg="history | grep "
eval "`pip3 completion --zsh`"
eval `ssh-agent -s`


def vibuf(){
if [ $# -gt 0 ]; then
echo $1 > /tmp/vitmp
elif test ! -t 0; then
cat > /tmp/vitmp
else
cat /tmp/vitmp
fi
}
 def tails(){
  history | grep -v history | grep -v history | tail -n 1 | cut -d ' ' -f 4- | vibuf
}
set -o vi
bindkey -s ^f "tmux-sessionizer\n"

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"#
