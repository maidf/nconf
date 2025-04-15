function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end
    
    set -l lpwd (set_color green) (prompt_pwd) (set_color normal)
    set -l lvcs (set_color blue) (fish_vcs_prompt) (set_color normal)
    set -l ltime (set_color red) (date '+%M:%S') (set_color normal)

    string join '' -- $ltime ' ' $lpwd $lvcs $stat '>'
end
