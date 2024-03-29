if [[ -f ~/.bash_aliases_google ]]; then
  source ~/.bash_aliases_google
fi

# Non Google.
alias iso_datetime='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias ll='ls -l --color'
alias xcp='xclip -selection c'
alias ninjaall='ls out | xargs -P10 -I {} tools/ninja -C out/{} -j8 all'
alias gc_branches="git cl status | grep '(closed)' | awk '{ print $1 }' | xargs -n1 git branch -D"
alias ff='find . -type f -name'
alias fd='find . -type d -name'
alias ovim='vim --remote'
alias svim='gvim --servername VIM'
alias wshell='adb wait-for-device && adb shell'
alias build_shell='cgexec --sticky -g cpu,memory:buildshell bash'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias spython='ipython -i $HOME/ipythonstartup.py'
alias ae='adb exec-out'
alias ar='adb root'
alias aw='adb wait-for-device'
alias armnt='adb root && adb remount'

function zssh {
  ssh -t $1 'zsh -l'
}

function newb {
  git fetch origin && git branch --track $1 origin/master && git checkout $1
}

function arst {
  adb shell su root stop $1 && sleep 1 && adb shell su root start $1
}

function pselect {
  export ANDROID_SERIAL=$(phone_db.py serial $1)
}

function adbgdb {
  adb forward tcp:5039 tcp:5039;
  adb shell "gdbserver64 --remote-debug :5039 --attach $1" &> /tmp/gdbserver &
  adb_proc=$!
  $HOME/perfetto/buildtools/ndk/prebuilt/linux-x86_64/bin/gdb -ex "target remote :5039"
  kill $adb_proc
}

function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function sumcol() {
  awk "{ SUM += \$${1} } END { print SUM }"
}

function zm() {
  setopt localoptions nomatch
  m
}

function chp() {
  git fetch ~/perfetto $1 && git cherry-pick FETCH_HEAD
}

function gitco {
  git checkout $1
  if (git stash list | grep $(git rev-parse --abbrev-ref HEAD) > /dev/null); then
    echo "You have stashes based on this branch"
  fi
}
