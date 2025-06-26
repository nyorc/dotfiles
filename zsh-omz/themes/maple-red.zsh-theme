# vim: ft=zsh
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local pro_username="%{$fg_bold[red]%}%n"
local user_symbol='$'

local user_host='%{$fg_no_bold[red]%}@%{$fg[white]%}%m%{$reset_color%}'
local time_bar='%{$fg[red]%}<%*>%{$reset_color%}'
local current_dir='%{$fg_bold[red]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'


PROMPT="%{$fg[red]%}%B╒%b%{$reset_color%}${pro_username}${user_host} ${time_bar} ${current_dir} ${git_branch}
%{$fg[red]%}%B╘%b%{$reset_color%}${user_symbol} "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=":%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=":%{$fg[green]%}✔"
