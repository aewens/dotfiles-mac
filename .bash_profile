source ~/.profile

ulimit -n 65536 65536
#rvm use 2.2.0 >/dev/null

PATH="$HOME/bin:${PATH}"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH
