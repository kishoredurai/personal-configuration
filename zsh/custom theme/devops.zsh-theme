autoload -Uz colors && colors
setopt PROMPT_SUBST

RPROMPT=""

# ---------------- Toggles ----------------
KUBE_PROMPT_ENABLED=true
AWS_PROMPT_ENABLED=true

# Turn on/off functions
kube_on()  { KUBE_PROMPT_ENABLED=true  && echo "kube prompt ON"  }
kube_off() { KUBE_PROMPT_ENABLED=false && echo "kube prompt OFF" }
aws_on()   { AWS_PROMPT_ENABLED=true   && echo "aws prompt ON"   }
aws_off()  { AWS_PROMPT_ENABLED=false  && echo "aws prompt OFF"  }
gcp_on()   { GCP_PROMPT_ENABLED=true   && echo "gcp prompt ON"   }
gcp_off()  { GCP_PROMPT_ENABLED=false  && echo "gcp prompt OFF"  }


# ---------------- Git Prompt Icons ----------------
ZSH_THEME_GIT_PROMPT_PREFIX="( %{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ) "
ZSH_THEME_GIT_PROMPT_SEPARATOR="%{$fg[white]%}|%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_CACHE=true

ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[yellow]%}~"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✘"

ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}"

ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[yellow]%}\$"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}="

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}⇡"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[cyan]%}⇣"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[cyan]%}⇕"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# ---------------- Kubernetes ----------------
kube_prompt() {
  [[ "$KUBE_PROMPT_ENABLED" != "true" ]] && return
  local ctx=$(kubectl config current-context 2>/dev/null)
  [[ -n "$ctx" ]] && echo "☸️ $ctx "
}

# ---------------- AWS (oh-my-zsh style) ----------------
# Uses $AWS_PROFILE or falls back to $AWS_DEFAULT_PROFILE
aws_prompt() {
  [[ "$AWS_PROMPT_ENABLED" != "true" ]] && return
  local profile="${AWS_PROFILE:-$AWS_DEFAULT_PROFILE}"
  [[ -n "$profile" ]] && echo "☁️ $profile "
}

# ---------------- GCP ----------------
gcp_prompt() {
  [[ "$GCP_PROMPT_ENABLED" != "true" ]] && return
  local proj=$(gcloud config get-value project 2>/dev/null)
  [[ -n "$proj" ]] && echo "☁️  $proj "
}

# ---------------- Prompt ----------------
PROMPT=$'\n''%F{214}%B%2~%b%f %F{33}$(kube_prompt)%f%F{214}$(aws_prompt)%f$(git_super_status)%f''%F{green}%B»%b%f '
