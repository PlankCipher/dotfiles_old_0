export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo "%{$fg[yellow]%}(%{$fg[magenta]%}`basename $VIRTUAL_ENV`%{$fg[yellow]%})%f "
}

setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

# enable VCS systems you use
# zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' enable git

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%f"
FMT_BRANCH="%{$fg[yellow]%}(%{$fg[magenta]%}%b%u%c%{$fg[yellow]%})${PR_RST}"
FMT_ACTION="%{$fg[yellow]%}(%{$fg[green]%}%a%{$fg[yellow]%})${PR_RST}"
FMT_UNSTAGED="%{$fg[blue]%} ●"
FMT_STAGED="%{$fg[green]%} ●"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

function steeef_precmd {
    if [[ -n $(git status -s 2> /dev/null | grep "??") ]]; then
        FMT_BRANCH="%{$fg[yellow]%}(%{$fg[magenta]%}%b%u%c %{$fg[red]%}●%{$fg[yellow]%})${PR_RST}"
    else
        FMT_BRANCH="%{$fg[yellow]%}(%{$fg[magenta]%}%b%u%c%{$fg[yellow]%})${PR_RST}"
    fi
    zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH} "

    vcs_info 'prompt'
}
add-zsh-hook precmd steeef_precmd

PROMPT=$'%{$fg[yellow]%}┏━%{$fg[red]%}$(echo "$? " | sed "s/^0 $//")%{$fg[yellow]%}[%{$fg[cyan]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%m%{$fg[yellow]%}] %{$fg[blue]%}%~${PR_RST} $vcs_info_msg_0_$(virtualenv_info)
%{$fg[yellow]%}┗━$ ${PR_RST}'
