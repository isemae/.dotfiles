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

set -x EDITOR /opt/homebrew/bin/nvim
set -x PATH "/Applications/Spotify.app/Contents/MacOS:$PATH"
set -x PATH "/Users/ji/.nvm/versions/node/v22.12.0/lib/node_modules:$PATH:$(npm bin -g)"
# source ~/.config/fish/functions/_pure_prompt_new_line.fish

alias fns="functions"
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
set -x FZF_DEFAULT_OPTS " \
  --height 60% --layout=reverse --border \
  --ansi \
"
set -gx FZF_DEFAULT_COMMAND "fd . "
set -gx FZF_ALT_C_COMMAND "fd -t d . $HOME"


set -U fish_user_paths $fish_user_paths ~/.local/bin

# Applications alias
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias zd="open -a /Applications/Zed.app -n"
alias sts="open -a /Applications/SpringToolSuite4.app/"
alias xc="xed"

# nvim
alias vim="nvim"
alias vi="nvim"
alias 퍄="nvim"
alias nv="neovide"

# chezmoi
alias czm="chezmoi"
alias cz="chezmoi"

# alias ls='ls --color=auto'
alias convmv-nfc='convmv -f utf-8 -t utf-8 --nfc --notest'

alias ls="lsd"
alias lsa="ls -a"
alias lst="ls --tree"
alias lla="ls -la"
alias lsf="ls -Fla --date relative"

# yt-dlp
alias dlp="yt-dlp"

# python
alias python="python3"
alias py="python3"

# cli bins
alias cat="bat"
alias man="tldr"
alias du="dust"
alias lzg="lazygit"

# basics
alias ...='cd ../../'
alias ....='cd ../../../'
alias psd="pushd"
alias ppd="popd"

# Bindings
bind \cd delete-char
bind \e\[1\;9D beginning-of-line # command+left 
bind \e\[1\;9C end-of-line # command+right

bind \e\x7F backward-kill-word
bind \e\[3\;3~ kill-word
bind \ed kill-word

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/liberica-jdk-17.jdk/Contents/Home
set -gx PATH $JAVA_HOME/bin:$PATH

# zoxide init --cmd cd fish | source
zoxide init fish | source
