source ~/.profile
source ~/.bashrc

ulimit -n 65536 65536
#rvm use default >/dev/null

function __prompt_command()
{
    # capture the exit status of the last command
    EXIT="$?"
    PS1=""

    if [ $EXIT -eq 0 ]; then PS1+="[+] "; else PS1+="[-] "; fi

    # if logged in via ssh shows the ip of the client
    #if [ -n "$SSH_CLIENT" ]; then PS1+="\[$Yellow\]("${$SSH_CLIENT%% *}")\[$Color_Off\]"; fi

    # debian chroot stuff (take it or leave it)
    PS1+="${debian_chroot:+($debian_chroot)}"

    # basic information (user@host:path)
    PS1+="\u @ \h : [ \w ] "

    # check if inside git repo
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
        else
            # Detached HEAD. (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null || echo HEAD`)"
        fi

        # add the result to prompt
        PS1+="[$branch] "
    fi

    # prompt $ or # for root
    PS1+="\n\$ "
}
PROMPT_COMMAND=__prompt_command

# alias python=/usr/bin/python

alias apachelog="cat /var/log/apache2/error_log"

PATH="$HOME/bin:${PATH}"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH=`brew --prefix python`/bin:$PATH
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}:${HOME}/bin"
PATH="$HOME/Library/Haskell/bin:$PATH"

export EVENT_NOKQUEUE=1

export PATH
export PATH=$PATH:/Users/aewens/Library/Haskell/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/opt/python/bin:/Users/aewens/bin:/Users/aewens/.nvm/versions/node/v6.3.1/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/aewens/.rvm/bin:/Users/aewens/.rvm/bin:/Users/aewens/bin:~/Desktop/nand2tetris/tools
