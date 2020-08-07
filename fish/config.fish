set fish_greeting

set -x EDITOR vi
set -x GREP_COLOR "1;37;45"
set -x JRUBYOPT "-Xcext.enabled=true"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x RBXOPT -X19

# Alias's
alias fuck='pkill node; pkill postgres; pkill redis;'

alias gitp='git push'
alias gita='git add .'
alias gits='git status'
alias gitl='git lg'
alias gitr='git reset (git log -n 1 --skip 1 --pretty=format:"%H")'
alias gitclean='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

alias ys='nvm use default && yarn start'
alias cat='ccat'

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function gitc     ; git commit -m $argv ; end
function grep     ; command grep --color=auto $argv ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

# nvm
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
nvm > /dev/null
