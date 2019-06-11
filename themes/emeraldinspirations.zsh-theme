
local user='%{$fg[green]%}%n@%{$fg[green]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

function get_custom_time {
  weekdayNum=$(date '+%w');
  if [ $weekdayNum '==' '0' ]; then
    weekdayAbbr='U'
  elif [ $weekdayNum '==' '1' ]; then
    weekdayAbbr='M'
  elif [ $weekdayNum '==' '2' ]; then
    weekdayAbbr='T'
  elif [ $weekdayNum '==' '3' ]; then
    weekdayAbbr='W'
  elif [ $weekdayNum '==' '4' ]; then
    weekdayAbbr='H'
  elif [ $weekdayNum '==' '5' ]; then
    weekdayAbbr='F'
  elif [ $weekdayNum '==' '6' ]; then
    weekdayAbbr='S'
  fi

  monthNum=$(date '+%m');
  if [ $monthNum  '==' '01' ]; then
    monthAbbr='♒'
  elif [ $monthNum '==' '02' ] ; then
    monthAbbr='♓'
  elif [ $monthNum '==' '03' ] ; then
    monthAbbr='♈'
  elif [ $monthNum '==' '04' ] ; then
    monthAbbr='♉'
  elif [ $monthNum '==' '05' ] ; then
    monthAbbr='♊'
  elif [ $monthNum '==' '06' ] ; then
    monthAbbr='♋'
  elif [ $monthNum '==' '07' ] ; then
    monthAbbr='♌'
  elif [ $monthNum '==' '08' ] ; then
    monthAbbr='♍'
  elif [ $monthNum '==' '09' ] ; then
    monthAbbr='♎'
  elif [ $monthNum '==' '10' ] ; then
    monthAbbr='♏'
  elif [ $monthNum '==' '11' ] ; then
    monthAbbr='♐'
  elif [ $monthNum '==' '12' ] ; then
    monthAbbr='♑'
  fi

  weekNum=$(date '+%W');
  monthdayNum=$(date '+%d');
  
  echo "${weekNum}${weekdayAbbr}${monthdayNum}${monthAbbr} %D{%I%M:%S}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="${user} ${pwd}
$ "
RPROMPT="%{$fg[magenta]%}\`get_custom_time\`%{$reset_color%}"
