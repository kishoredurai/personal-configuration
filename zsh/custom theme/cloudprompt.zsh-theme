# ═══════════════════════════════════════════════════════════════════════════
#  CLOUDPROMPT ZSH THEME
#  Kubernetes • AWS • GCP • Git — multi-cloud prompt
#  Based on lukerandall / gallifrey
# ═══════════════════════════════════════════════════════════════════════════


# ═══════════════════════════════════════════════════════════════════════════
#  PROMPT CUSTOMIZATION
#  Edit this section only to change prompt behavior
# ═══════════════════════════════════════════════════════════════════════════

# ─── Segment toggles (true | false) ─────────────────────────────────────
# Show/hide cloud & k8s segments in new sessions
export SHOW_KUBE_CTX=true
export SHOW_AWS_PROFILE=true
export SHOW_GCP_PROJECT=true

# ─── Path & return code ──────────────────────────────────────────────────
# Path: %2~ = last 2 dirs, %~ = full path, %1~ = last 1 dir
local prompt_path="%2~"
# Return code when command fails (set to "" to hide)
local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

# ─── Icons & colors ─────────────────────────────────────────────────────
# Optional: change look of segments here (GCP uses Nerd Font - nf-fa-google)
local _kube_icon="☸️"
local _kube_color=$'\e[38;2;0;139;255m'   # blue #008BFF (true color)
local _aws_icon="☁️"
local _aws_color=$'\e[38;2;241;188;49m'   # AWS orange #F1BC31 (true color)
local _gcp_icon="☁️"   # Nerd Font: fa-google (use a Nerd Font in terminal)
local _gcp_color="$fg[cyan]"
local _path_color="%{$(tput setaf 214)%}%{$fg_bold[orange]%}"
local _prompt_char="»"


# ═══════════════════════════════════════════════════════════════════════════
#  PROMPT SEGMENTS (implementation)
#  No need to edit below unless adding new segment types
# ═══════════════════════════════════════════════════════════════════════════

# ─── Kubernetes ──────────────────────────────────────────────────────────
export KUBE_CTX_CACHE=""
function update_kube_ctx_cache() {
  KUBE_CTX_CACHE=$(kubectl config current-context 2>/dev/null)
}
update_kube_ctx_cache

function kubectx_prompt_info() {
  if [[ "$SHOW_KUBE_CTX" == true && -n "$KUBE_CTX_CACHE" ]]; then
    print -n " %{$fg[blue]%}${_kube_icon}%{${_kube_color}%} $KUBE_CTX_CACHE%{$reset_color%}"
  fi
}
function kube-on() {
  export SHOW_KUBE_CTX=true
  update_kube_ctx_cache
  echo "✅ Kubernetes context prompt enabled: $KUBE_CTX_CACHE"
}
function kube-off() {
  export SHOW_KUBE_CTX=false
  echo "🚫 Kubernetes context prompt disabled"
}

# ─── AWS Profile ──────────────────────────────────────────────────────────
# Displays when AWS_PROFILE is set; use aws-on / aws-off to toggle prompt
function aws_profile_prompt_info() {
  if [[ "$SHOW_AWS_PROFILE" == true && -n "$AWS_PROFILE" ]]; then
    print -n " %{$fg[yellow]%}${_aws_icon}%{${_aws_color}%} $AWS_PROFILE%{$reset_color%}"
  fi
}
function aws-on() {
  export SHOW_AWS_PROFILE=true
  echo "✅ AWS profile prompt enabled${AWS_PROFILE:+: $AWS_PROFILE}"
}
function aws-off() {
  export SHOW_AWS_PROFILE=false
  echo "🚫 AWS profile prompt disabled"
}

# ─── GCP Project ──────────────────────────────────────────────────────────
# Displays when gcloud project is set; use gcp-on / gcp-off to toggle prompt
export GCP_PROJECT_CACHE=""
function update_gcp_project_cache() {
  GCP_PROJECT_CACHE=$(gcloud config get-value project 2>/dev/null | tr -d '\n')
}
update_gcp_project_cache

function gcp_project_prompt_info() {
  if [[ "$SHOW_GCP_PROJECT" == true && -n "$GCP_PROJECT_CACHE" && "$GCP_PROJECT_CACHE" != "(unset)" ]]; then
    print -n " %{$fg[magenta]%}${_gcp_icon}%{${_gcp_color}%} $GCP_PROJECT_CACHE%{$reset_color%}"
  fi
}
function gcp-on() {
  export SHOW_GCP_PROJECT=true
  update_gcp_project_cache
  echo "✅ GCP project prompt enabled${GCP_PROJECT_CACHE:+: $GCP_PROJECT_CACHE}"
}
function gcp-off() {
  export SHOW_GCP_PROJECT=false
  echo "🚫 GCP project prompt disabled"
}


# ═══════════════════════════════════════════════════════════════════════════
#  PROMPT ASSEMBLY
#  Order: path | kube | aws | gcp | git | prompt char
#  Remove or reorder segments by editing the PROMPT line below
# ═══════════════════════════════════════════════════════════════════════════

PROMPT=$'\n''${_path_color}'"${prompt_path}"'%{$reset_color%}$(kubectx_prompt_info)$(aws_profile_prompt_info)$(gcp_project_prompt_info)$(git_super_status) %B'"${_prompt_char}"'%b '
RPS1="${return_code}"


# ═══════════════════════════════════════════════════════════════════════════
#  GIT PROMPT STYLING
#  Used by oh-my-zsh git plugin (git_super_status)
# ═══════════════════════════════════════════════════════════════════════════

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_CACHE=true
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_TRACKED="✔️"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="✘"
ZSH_THEME_GIT_PROMPT_STASHED="$"
ZSH_THEME_GIT_PROMPT_UNMERGED="="
ZSH_THEME_GIT_PROMPT_AHEAD="⇡"
ZSH_THEME_GIT_PROMPT_BEHIND="⇣"
ZSH_THEME_GIT_PROMPT_DIVERGED="⇕"
