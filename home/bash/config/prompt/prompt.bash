#
# prompt.bash
#

clear_color="\e[0m"
clear_color="\e[0m"
red_color="\e[31m"
blue_color="\e[34m"
green_color="\e[32m"

git_branch_name="()"

fn_get_git_branch() {
git_branch_name=$(git branch --show-current 2>/dev/null)
if [ $git_branch_name ]
then
    echo "$green_color("$left_str" "$git_branch_name$right_str")$clear_color"
fi
}

fn_get_workspace() {
    echo "$blue_color[\w]$clear_color"
}

fn_get_user_name() {
    echo "$red_color[\u@\h]$clear_color"
}

PS1="$(fn_get_user_name)$(fn_get_git_branch)$(fn_get_workspace)\n> "
