export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
source "$XDG_CONFIG_HOME/misc/aliases"
export EDITOR="/snap/bin/nvim"
################################################################################
#                                                                              #
# Options                                                                      #
#                                                                              #
################################################################################
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP
bindkey -e  # emacs mode
################################################################################
#                                                                              #
# Completion                                                                   #
#                                                                              #
################################################################################
## menu-style
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zstyle ':completion:*' special-dirs true
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Tab completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# add new installed packages into completions
zstyle ':completion:*' rehash true
# Use better completion for the kill command
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;34'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# use completion cache
zstyle ':completion::complete:*' use-cache true
################################################################################
#                                                                              #
# Plugins                                                                      #
#                                                                              #
################################################################################
#auto suggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
set ZSH_AUTOSUGGEST_USE_ASYNC=true
#fast syntax highlighting
source ~/.config/zsh/plugins/fast-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fpath+=~/.config/zsh/plugins/conda-zsh-completion
compinit conda
################################################################################
#                                                                              #
# Prompt - Minimal                                                             #
#                                                                              #
################################################################################
# PROMPT='%b%F{#0b98de}%~ %f
# %? %F{#fd9014}%(!.#.>) %f'
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
#
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' stagedstr '%F{yellow}●%f'
# zstyle ':vcs_info:*' unstagedstr '%F{red}●%f'
# zstyle ':vcs_info:git:*' formats '[%F{green}%b%f%c%u]'
# zstyle ':vcs_info:git:*' actionformats '[%F{cyan}%b (%a)%f%c%u]'
#
# RPROMPT='$vcs_info_msg_0_'

################################################################################
#                                                                              #
# Prompt - Powerlevel10k                                                       #
#                                                                              #
################################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
################################################################################
#                                                                              #
# Environment                                                                  #
#                                                                              #
################################################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nicolas/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nicolas/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nicolas/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nicolas/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# rust
. "$HOME/.cargo/env"
# nvm/node
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
