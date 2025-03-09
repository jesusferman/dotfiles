# Password prompts, [y/n] confirmations, etc. must go above this block
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# PLUGINS
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
autoload -U compinit && compinit

# ALIAS
alias pacin='sudo pacman -S'
alias pacrm='sudo pacman -Rs'
alias pacloc='pacman -Q'
alias pacup='sudo pacman -Syu'
alias vol='pulsemixer'
alias ff='fastfetch'
alias rc='nvim ~/.zshrc'
alias ls='ls --color'

# POWERLEVEL10K, run 'p10k configure'
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# HISTORY
HISTSIZE=500
HISTFILE=~/.zhist
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
