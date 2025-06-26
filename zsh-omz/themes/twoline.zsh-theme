# vim: ft=zsh
local return_code="%(?..%{$fg[red]%}%?↵%{$reset_color%})"

local user_symbol='$'

local time_bar='%{$fg_bold[red]%}[%*]%{$reset_color%}'
local current_dir='%{$fg_bold[black]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="%{$fg[red]%}%B➦ %b%{$reset_color%}${time_bar} ${current_dir} ${git_branch}
%{$fg[red]%}%B➥ %b%{$reset_color%}${user_symbol} "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=":%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=":%{$fg[green]%}✔"
