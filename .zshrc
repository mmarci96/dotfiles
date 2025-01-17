# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source /usr/share/zsh/zshrc

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( git sudo zsh-autosuggestions zsh-syntax-highlighting terraform )

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#d787ff,bold'
HISTIGNORE='*git commit*:*ls*:*cd*:*git add*'

export _JAVA_AWT_WM_NONREPARENTING=1

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if (( $+commands[luarocks] )); then
    eval `luarocks path --bin`
fi

# Enable AWS CLI autocompletion
complete -C aws_completer aws

export PATH=$HOME/.local/bin:$PATH
export GTK_THEME=Adwaita-dark


# Prompt with Rose Pine colors
PROMPT='%F{#eb6f92}%n%F{#31748f}@%F{#9ccfd8}%m %F{#f6c177}%~ %F{#c4a7e7}$(git_branch) %F{#e1def4}%% '

# Syntax highlighting with Rose Pine colors
ZSH_HIGHLIGHT_STYLES[command]='fg=#9ccfd8'            # Teal for commands
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#31748f'              # Blue for builtins
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#eb6f92,bold'   # Red for reserved words
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6e6a86'              # Muted gray for comments
ZSH_HIGHLIGHT_STYLES[alias]='fg=#f6c177'                # Yellow for aliases
ZSH_HIGHLIGHT_STYLES[string]='fg=#c4a7e7'               # Purple for strings
ZSH_HIGHLIGHT_STYLES[function]='fg=#ebbcba,bold'        # Peach for functions
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#eb6f92,bold'   # Red for unknown tokens
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#f6c177'             # Yellow for globbing
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#31748f'    # Blue for history expansion
ZSH_HIGHLIGHT_STYLES[parameter]='fg=#9ccfd8'            # Teal for parameters

# Syntax highlighting for terraform
RPROMPT='$(tf_prompt_info)'
RPROMPT='$(tf_version_prompt_info)'

ZSH_THEME_TF_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_TF_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_TF_VERSION_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_TF_VERSION_PROMPT_SUFFIX="%{$reset_color%}"

# Aliases for fun
alias ll='ls -lh --color=auto'
alias gs='git status'
alias k8='kubectl '
alias vi="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
