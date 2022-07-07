# EXPORT
export EDITOR='nvim'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

# "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Adding ~/.local/bin to the path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Suggestions appear while writing
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null

# Search repos for programs that can't be found
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# Better ls
alias ls="exa"
alias ll="exa -l -g --icons"
alias la="ll -a"


# Changing "ls" to "exa"
alias ls='exa --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -la --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --icons --color=always --group-directories-first'  # long format
alias lt='exa -aT --icons --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# For managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# z functionality on zsh
eval "$(zoxide init zsh)"

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init zsh)"
