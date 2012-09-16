
# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# Custom functions
[[ -f "$HOME/.bash/functions" ]] && . "$HOME/.bash/functions"

# Custom aliases
[[ -f "$HOME/.bash/aliases" ]] && . "$HOME/.bash/aliases"

# Computer specific bashrc config
[[ -f /etc/.bashrc.custom ]] && . /etc/.bashrc.custom

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Start typing a command at a shell prompt, then hit up/down for history search
# using the inputted text as the beginning of the search string
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Colors
COLOR_RESET="\[\e[0m\]"
COLOR_GREEN="\e[0;32m"
COLOR_YELLOW="\e[1;33m"

# Set up prompt with git support
git_prompt() {
	[[ -z $(git rev-parse --git-dir 2>&-) ]] && return 0

	git_branch=$(git branch --no-color 2>&- | sed -n "/^\*/s/^\* //p")

	[[ $(git status 2>&- | tail -n1) =~ "nothing to commit" ]] && git_status="" || git_status="*"

	echo " [$git_branch$git_status]"
}

PROMPT_COMMAND='PS1="\n${COLOR_YELLOW}\u@\h${COLOR_RESET}\e]2;\w\a ${COLOR_GREEN}[\w]${COLOR_YELLOW}$(git_prompt)${COLOR_RESET} \n > "'

# Continuously append commands to history file.
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
