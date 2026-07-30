export EDITOR=$(which vim)

# export HISTSIZE=2000
# export HISTFILE="$HOME/.history"
# export SAVEHIST=$HISTSIZE
# setopt hist_ignore_all_dups
 
alias g="git"

g_pr_push () {
  readonly brname=${1:?"Branch name must be specified."}
  git push -u origin +$brname
}

#g_pr_push_upstream() {
#  readonly brname=${1:?"Branch name must be specified."} 
#  git push upstream +$brname
#}

#g_rebase_forked () { 
#  git pull upstream main --rebase
#}

g_rebase () {
  git fetch && git rebase origin/main
}

g_cherry_pick_branch () {
  readonly brname=${1:?"Branch name must be specified."}
  hash=$(git rev-parse $brname)

  git switch --detach && git cherry-pick $hash && git branch --force $brname && git switch $brname
}

g_continue_cherry_pick_branch () {
  readonly brname=${1:?"Branch name must be specified."}

  git cherry-pick --continue && git branch --force $brname && git switch $brname
}

# up/down arrows in command line search through matching command history
# mac (zsh)
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# bash
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'

