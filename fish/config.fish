#      __ _     _
#     / _(_)___| |__  _ __ ___
#    | |_| / __| '_ \| '__/ __|
#    |  _| \__ \ | | | | | (__
#    |_| |_|___/_| |_|_|  \___|

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "nvim"                                 # $EDITOR use Emacs in terminal

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
# function fish_user_key_bindings
  # fish_default_key_bindings
#  fish_vi_key_bindings
# end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### SPARK ###
set -g spark_version 1.0.0

complete -xc spark -n __fish_use_subcommand -a --help -d "Show usage help"
complete -xc spark -n __fish_use_subcommand -a --version -d "$spark_version"
complete -xc spark -n __fish_use_subcommand -a --min -d "Minimum range value"
complete -xc spark -n __fish_use_subcommand -a --max -d "Maximum range value"

function spark -d "sparkline generator"
    if isatty
        switch "$argv"
            case {,-}-v{ersion,}
                echo "spark version $spark_version"
            case {,-}-h{elp,}
                echo "usage: spark [--min=<n> --max=<n>] <numbers...>  Draw sparklines"
                echo "examples:"
                echo "       spark 1 2 3 4"
                echo "       seq 100 | sort -R | spark"
                echo "       awk \\\$0=length spark.fish | spark"
            case \*
                echo $argv | spark $argv
        end
        return
    end

    command awk -v FS="[[:space:],]*" -v argv="$argv" '
        BEGIN {
            min = match(argv, /--min=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
            max = match(argv, /--max=[0-9]+/) ? substr(argv, RSTART + 6, RLENGTH - 6) + 0 : ""
        }
        {
            for (i = j = 1; i <= NF; i++) {
                if ($i ~ /^--/) continue
                if ($i !~ /^-?[0-9]/) data[count + j++] = ""
                else {
                    v = data[count + j++] = int($i)
                    if (max == "" && min == "") max = min = v
                    if (max < v) max = v
                    if (min > v ) min = v
                }
            }
            count += j - 1
        }
        END {
            n = split(min == max && max ? "▅ ▅" : "▁ ▂ ▃ ▄ ▅ ▆ ▇ █", blocks, " ")
            scale = (scale = int(256 * (max - min) / (n - 1))) ? scale : 1
            for (i = 1; i <= count; i++)
                out = out (data[i] == "" ? " " : blocks[idx = int(256 * (data[i] - min) / scale) + 1])
            print out
        }
    '
end
### END OF SPARK ###


### FUNCTIONS ###

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Render markdown files using glow
# ex: glow file.md
function md --argument arg
    glow "$arg" -s dark | less -r
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

### END OF FUNCTIONS ###


### ALIASES ###
# spark aliases
alias clear='/bin/clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# navigation
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# system & update sec
alias au='sudo apt update'
alias aU='sudo apt upgrade'
alias ai='sudo apt install'
alias fu='flatpak update'
alias fU='flatpak uninstall --unused'
alias ar='sudo apt --purge remove'
alias ssn='sudo shutdown now'
alias sr='sudo reboot'
alias sd='sudo'
alias sn='shutdown now'
alias ua='bash ~/Stuff/files/configs/shell-scripts/startup.sh'

# rclone sec
alias rfiles='echo "Syncing to drive" | cowsay -f tux && rclone sync -P files/ drivec:/files/ --exclude ".git/**" --exclude ".gitsecret/**" '
alias rcloud='echo "Syncing to drive" | cowsay -f tux && rclone sync -P dropbox/ drivec:/dropbox/'
alias revfiles='echo "Syncing to localhost" | cowsay -f tux && rclone sync -P drivec:/files/ files/ --exclude ".git/**" --exclude ".gitsecret/**" '
alias revcloud='echo "Syncing to localhost" | cowsay -f tux && rclone sync -P drivec:/dropbox/ dropbox/'
alias rdrop='echo "Syncing to both cloud providers" | cowsay -f tux && rclone sync -P dropbox/ db:/unsec/ && echo "" && rclone sync -P dropbox/ drivec:/dropbox/'
alias revdrop='echo "Syncing to localhost" | cowsay -f tux && rclone sync -P db:/unsec/ dropbox/'

# text editors
alias v='vim'
alias e='nvim'
alias vimrc='vim ~/.vimrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias bashrc='nvim ~/.bashrc'
alias fishrc='nvim ~/.config/fish/config.fish'

# vagrant sec
alias vu='vagrant up'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias vs='vagrant ssh'

# exa
alias ls='exa --color=always --group-directories-first' 
alias la='exa -a --color=always --group-directories-first'  
alias ll='exa -al --color=always --group-directories-first'  
alias l.='exa -a | egrep "^\."'

# git
alias pull='git pull github main && sleep 5 && git pull gitlab main'
alias push='git push github main && sleep 5 && git push gitlab main'
alias add='git add .'
alias commit='git commit -S -m'
alias rcommit='git commit -m'
alias tlog='git log --graph --oneline --branches'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias fetch='git fetch'
alias pullit='git pull origin'
alias pushit='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# others
alias gt='gpg2 --card-status'
alias yt='ykman list'
alias yd='youtube-dl'
alias btop='bpytop'
alias dc='sudo docker'
alias wu='sudo wg-quick up wg0'
alias wd='sudo wg-quick down wg0'
alias tb="nc termbin.com 9999"  # usage [echo "hello world" | tb] , [cat file | tb]

### END OF ALIASES ###

# other program configs
set FD_OPTIONS "--follow --exclude .git --exclude node_modules"
set BAT_PAGER "less -R"

# fzf configs
set FZF_DEFAULT_OPTS "--no-mouse --height 70% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview'"
set FZF_DEFAULT_COMMAND "fd --type f --hidden --follow -E libreoffice -E plugged -E coc -E google-chrome -E Code -E .git -E tor -E .local -E .vscode -E .npm -E oth -E snap -E .cache -E .zoom -E .vim -E node_modules  -E .ansible -E .anydesk -E .atom -E .clamtk -E .fzf -E .gem -E .gnupg -E ipython -E .joplin -E .jupyter -E .mozilla -E .npm -E .password-store -E .pki -E .ssh -E .var -E .vagrant.d -E vagrant  "
set FZF_CTRL_T_COMMAND "fd --type f --hidden --follow -E libreoffice -E plugged -E coc -E google-chrome -E Code -E .git -E tor -E .local -E .vscode -E .npm -E oth -E snap -E .cache -E .zoom -E .vim -E node_modules  -E .ansible -E .anydesk -E .atom -E .clamtk -E .fzf -E .gem -E .gnupg -E ipython -E .joplin -E .jupyter -E .mozilla -E .npm -E .password-store -E .pki -E .ssh -E .var -E .vagrant.d  -E vagrant " 
# set FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
set FZF_ALT_C_COMMAND "fd --type d $FD_OPTIONS"
#set PATH=$PATH:$HOME/.local/bin


### SETTING THE STARSHIP PROMPT ###
starship init fish | source
