fzf --fish | source

set -x FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git "
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

set -x FZF_CTRL_T_OPTS "--preview 'bat -n --line-range :500 {}'"
set -x FZF_ALT_C_OPTS "--preview 'eza --icons=always --tree --color=always {} | head -200'"

# set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
#   --height=90% \
#   --highlight-line \
#   --info=inline-right \
#   --ansi \
#   --border \
#   --layout=default \
#   --color=bg+:#283457 \
#   --color=bg:-1 \
#   --color=border:#27a1b9 \
#   --color=fg:#c0caf5 \
#   --color=gutter:#16161e \
#   --color=header:#ff9e64 \
#   --color=hl+:#2ac3de \
#   --color=hl:#2ac3de \
#   --color=info:#545c7e \
#   --color=marker:#ff007c \
#   --color=pointer:#ff007c \
#   --color=prompt:#2ac3de \
#   --color=query:#c0caf5:regular \
#   --color=scrollbar:#27a1b9 \
#   --color=separator:#ff9e64 \
#   --color=spinner:#ff007c \
# "

set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
  --height=90% \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --border \
  --layout=default \
	--color=bg:-1 \
  --color=bg+:#313244 \
	--color=spinner:#f2cdcd \
	--color=hl:#eba0ac \
  --color=hl+:#eba0ac \
  --color=fg:#CDD6F4 \
  --color=fg+:#CDD6F4 \
	--color=header:#F38BA8 \
	--color=info:#89dceb \
	--color=pointer:#f5e0dc \
  --color=marker:#B4BEFE \
	--color=prompt:#eba0ac \
	--color=query:#CDD6F4 \
  --color=selected-bg:#45475A \
  --color=border:#89b4fa \
	--color=label:#CDD6F4 \
  --color=separator:#f2cdcd \
  --color=gutter:-1 \
"
