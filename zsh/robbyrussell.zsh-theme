PROMPT="%(?:%{$fg_bold[green]%}%1{»%}:%{$fg_bold[red]%}%1{»%}) %{$fg_bold[magenta]%}[ %c ]%{$reset_color%} "
PROMPT+='$(git_prompt_info)%{$fg_bold[white]%}%1{:%}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}git:[ %{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%} ]"
