if status is-interactive
    # Commands to run in interactive sessions can go here
end


# term settings
function dedup_path
    set -gx PATH (string split ':' $PATH | sort -u | string join ':')
end

if test (arch) = arm64
    set arm64_paths \
        /opt/homebrew/bin \
        /opt/homebrew/sbin \
        /usr/local/bin \
        /usr/local/sbin \
        /Users/ji/.cargo/bin \
        /Users/ji/bin

    for p in $arm64_paths
        if not contains $p $PATH
            set -x PATH $p $PATH
        end
    end

else
    set x86_paths /usr/local/bin /usr/local/sbin

    for p in $x86_paths
        if not contains $p $PATH
            set -x PATH $p $PATH
        end
    end
end

source ~/.config/fish/functions/_pure_prompt_new_line.fish


set -U fish_greeting

set -q glyph_status_jobs; or set -g glyph_status_jobs "#"
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_char_dirtystate '±'
set -g theme_short_path no
set -U pure_show_system_time false
set -U pure_reverse_prompt_symbol_in_vimode true

# fzf 
# bind -M insert ç fzf-cd-widget
fzf --fish | source
set -x FZF_DEFAULT_OPTS "--height 60% --layout=reverse --border"
set -gx FZF_DEFAULT_COMMAND "fd . "
set -gx FZF_ALT_C_COMMAND "fd -t d . $HOME"


alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias zd="open -a /Applications/Zed.app -n"
alias xc="xed"

# nvim
alias vim="nvim"
alias vi="nvim"
alias svi="sudo nvim"

# chezmoi
alias czm="chezmoi"
alias cz="chezmoi"

# yazi
alias yz="yazi"

# alias ls='ls --color=auto'
alias la="lsd -a"
alias lf="lsd -Fla"
alias ls="lsd"

# thefuck
alias fk="thefuck"
# yt-dlp
alias dlp="yt-dlp"

#python
alias python="python3"
alias py="python3"

# dedup_path
