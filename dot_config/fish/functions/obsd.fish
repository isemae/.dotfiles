# alias obsd="open \"obsidian://open?vault=\"(string escape --style=url (basename $PWD))"
function obsd
    if test (count $argv) -eq 0
        open "obsidian://"
    else
        set dir (realpath $argv[1])
        open "obsidian://open?vault="(string escape --style=url (basename $dir))
    end
end
