export BBBUCKET=git@bitbucket.org

eval "$(direnv hook bash)"
eval "$(rbenv init -)"

export PATH=:~/bin:$PATH
PYLOCAL=~/Library/Python/2.7

# need qt on the path for wktohtml
# qt was installed with brew, so the way to do it is:
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
# but that's annoying slow, so we hard-code
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

# Proof production is using Postgres ~10
# There are multiple versions of postgres on this machine.
# I installed v12 for some projects and started using that
# for proof development as well.
# If you need to use v10, uncomment below.
#export PATH="/usr/local/Cellar/postgresql@10/10.13_1/bin:$PATH"

# proofgov needs node@12;
export PATH="/usr/local/opt/node@12/bin:$PATH"
# if compilers need node 12, they'll need the following
# export LDFLAGS="-L/usr/local/opt/node@12/lib"
# export CPPFLAGS="-I/usr/local/opt/node@12/include"

# brew's openssl is keg only. To access it, you'll need
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# compilers will need
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# and pkg-config will need
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# webpacker needs yarn in the PATH
# rbenv's shim for a ruby util called yarn overrides our install, so we add it explicitly.
# again, the way to do it is:
# export PATH="$(brew --prefix yarn)/bin:$PATH"
# but that's slow, so we hardcode
export PATH="/usr/local/opt/yarn/bin:$PATH"

export GOPATH=~/go

export EDITOR=vim
export VISUAL=vim

# this disappeared with an awsebcli update. Not sure whether to replace
#source $PYLOCAL/bin/eb_completion.bash

function to_bin() {
	cat $1 | python -c "import sys, binascii; sys.stdout.write(binascii.unhexlify(sys.stdin.readline().strip()))"
}

function from_bin() {
	cat $1 | python -c "import sys, binascii; sys.stdout.write(binascii.hexlify(sys.stdin.read()))"
}

export NVM_DIR=~/.nvm
# NVM init substantially slows shell boot.
# This is a nuisance when continually creating new tmux context.
# Disabling here; remember to activate before starting an ember session!
nvm_init() {
  . $(brew --prefix nvm)/nvm.sh
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# source $HOME/Documents/clearbanc/.bashrc # clearbanc development support

git_branch_merged() {
  git branch --merged | egrep -v "(^\*|master|dev)"
}

git_branch_d_merged() {
  git_branch_merged | xargs git branch -d
}

git_branch_recent() {
  git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)' | head -n 10
}

git_branch_recent_me() {
  git for-each-ref \
    --sort=-committerdate refs/heads/ \
    --format='%(committerdate:short) %(authoremail) %(refname:short)' | \
  grep $(git config user.email) | \
  awk '{ print $1, $3 }' | \
  head -n 10
}

git_my_recent_branches () {
  git_branch_recent_me
}

# What IP am I seen to be behind from the public internet?
# alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
wanip() {
  dig +short myip.opendns.com @resolver1.opendns.com
}

# helpers for active projects
source ~/Documents/proof/dev-support.sh
alias rs='rails server'
alias rc='rails console'
alias rdm='rails db:migrate'
alias rdr='rails db:rollback'
alias ru='bin/update'
alias r='rails'
alias g='git'
alias gti='git'
alias dc='docker-compose'
alias dc-dev='docker-compose -f docker-compose.dev.yml'
alias dev='docker-compose -f docker-compose.development.yml'

