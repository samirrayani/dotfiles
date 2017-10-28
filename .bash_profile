#
# My .bash_profile
#

# colors
LIGHT_GRAY="\[\033[0;37m\]"; BLUE="\[\033[1;36m\]"; RED="\[\033[0;31m\]"; LIGHT_RED="\[\033[1;31m\]";
GREEN="\[\033[0;32m\]"; WHITE="\[\033[1;37m\]"; LIGHT_GRAY="\[\033[0;37m\]"; YELLOW="\[\033[1;33m\]";

# parse_git_*()
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/';
}
function parse_git_status {
 #git status 2> /dev/null | sed -e '/(working directory clean)$/!d' | wc -l;
  git status 2> /dev/null | grep "working tree clean" | wc -l;
}
function check_git_changes {
  # tput setaf 1 = RED, tput setaf 2 = GREEN
  [ `parse_git_status` -ne 1 ] && tput setaf 1 || tput setaf 2
}

# display machine, site, git status
SITE=`cat /etc/sitename`
export PS1="$YELLOW\h.$SITE$ \w\[\$(check_git_changes)\]\$(parse_git_branch)$LIGHT_GRAY $ "

# case in-sensitive tab autocomplete
bind "set completion-ignore-case on"
