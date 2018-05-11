if [[ -f ~/.bash_alises_google ]]; then
  source ~/.bash_aliases_google
fi

# Non Google.
alias iso_datetime='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias ll='ls -l --color'
alias xcp='xclip -selection c'
alias ninjaall='ls out | xargs -P10 -I {} tools/ninja -C out/{} -j8 all'
alias gc_branches="git cl status | grep '(closed)' | awk '{ print $1 }' | xargs -n1 git branch -D"
alias ff='find -type f -name'
alias fd='find -type d -name'
alias ovim='vim --remote'
alias svim='gvim --servername VIM'
alias wshell='adb wait-for-device && adb shell'
alias build_shell='cgexec --sticky -g cpu,memory:buildshell bash'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
