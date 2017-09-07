set fish_greeting

set -x EDITOR vi
set -x GREP_COLOR "1;37;45"
set -x JRUBYOPT "-Xcext.enabled=true"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x RBENV_ROOT /usr/local/var/rbenv
set -x RBXOPT -X19

# Alias's
alias fuck='pkill node; pkill postgres; pkill mongo; pkill ruby; pkill boxoffice; pkill redis; pkill kraken; pkill varnish'

alias gitp='git push'
alias gita='git add .'
alias gits='git status'
alias gitl='git lg'
alias gitr='git reset (git log -n 1 --skip 1 --pretty=format:"%H")'
alias gitclean='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

alias ys='yarn start'
alias ydb='yarn run db'
alias moca='cd ~/Documents/programming/padpiper/moca & atom .'
alias espresso='cd ~/Documents/programming/padpiper/espresso & atom .'
alias cat='ccat'

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function a        ; command ag --ignore=.git --ignore=log --ignore=tags --ignore=tmp --ignore=vendor --ignore=spec/vcr --ignore=bower_components/ --ignore=node_modules/ $argv ; end
function b        ; bundle exec $argv ; end
function d        ; du -h -d=1 $argv ; end
function df       ; command df -h $argv ; end
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function g        ; git $argv ; end
function gitc     ; git commit -m $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end

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

make_completion b 'bundle exec'
make_completion f 'foreman run'
make_completion g 'git'
make_completion mp 'nvim'
make_completion vp 'nvim'

# rbenv
status --is-interactive; and . (rbenv init -|psub)

# nvm
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
nvm > /dev/null
