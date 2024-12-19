# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source /usr/share/zsh/zshrc

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting aws)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#d787ff,bold'

export _JAVA_AWT_WM_NONREPARENTING=1

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if (( $+commands[luarocks] )); then
    eval `luarocks path --bin`
fi

# Enable AWS CLI autocompletion
complete -C aws_completer aws

alias vi="nvim"
alias picomstart="picom --config ~/.config/picom/picom.conf -b"
alias idea='intellij-idea-ultimate-edition & disown'
export PATH=$HOME/.local/bin:$PATH
export GTK_THEME=Adwaita-dark

# Promt colors for fun wohooo
PROMPT='%F{green}%n%F{blue}@%F{cyan}%m %F{yellow}%~ %F{red}$(git_branch) %F{reset_color}%% '

# Syntax highlighting
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#FFCC1B'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#9CF087'
ZSH_HIGHLIGHT_STYLES[string]='fg=magenta'

# Aliases for fun
alias ll='ls -lh --color=auto'
alias gs='git status'


