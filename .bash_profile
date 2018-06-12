# Add variable definitions for makara-maven:
export MAKARA_YOCTO_PATH=~/repositories/makara/makara-yocto
echo -e "\tExported MAKARA_YOCTO_PATH as $MAKARA_YOCTO_PATH"
export MAKARA_BUILD_DIR=build-makara
echo -e "\tExported MAKARA_BUILD_DIR as $MAKARA_BUILD_DIR"
# Add shortcuts for working directories:
# for MAKARA
export MAK=~/repositories/makara/makara-yocto/meta-makara/
echo -e "\tExported MAK as $MAK"

# for DORADO
export DOR=~/repositories/dorado/dorado-yocto/meta-dorado/
echo -e "\tExported DOR as $DOR"

# for other repositories
export REPS=~/repositories/
echo -e "\tExported REPS as $REPS"

# export the PATH variable to include the current users bin directory
path="/home/$USER/bin"
export PATH=$PATH:$path
echo -e "\tAdded $path to PATH"

if [ -e ~/.curr_path ]; then
    export CURR_PATH=`cat ~/.curr_path`
else
    read curr_path
    export CURR_PATH=$curr_path
fi
echo -e "\tExported CURR_PATH as $CURR_PATH"

# Add shell ls colors and ls aliases
if [ -f ~/.bash_ls ]; then
    echo "Running .bash_ls..."
    . ~/.bash_ls
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    echo "Running .bash_aliases..."
    . ~/.bash_aliases
fi

# For bash GIT completions.
if [ -f /usr/share/bash-completion/completions/git ]; then
    echo "Running /usr/share/bash-completion/completions/git..."
    . /usr/share/bash-completion/completions/git
fi

# For bash GIT prompt.
if [ -f ~/.bash_git_prompt ]; then
    echo "Running .bash_git_prompt..."
    . ~/.bash_git_prompt
fi

# Parse git for clean dir
function parse_git_dirty {
  [[ "$(git status 2> /dev/null | tail -n1)" != "nothing to commit (working directory clean)" ]] && echo "*"
}

# To display git branch
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\u@\h \[\033[01;34m\]\w\[\033[01;35m\] : $(parse_git_branch)\[\033[01;34m\] \n\$ \[\033[00m\]'
else
    PS1='\[\033[01;00m\]\w\[\033[00;33m\] : $(parse_git_branch)\[\033[00m\] \n\$ '
fi

# End of Git branch config

# Launch tmux
tmux -2
