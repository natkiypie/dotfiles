# exit terminal
alias q='exit'
# logout
alias logout='pkill -KILL -u natkiypie'
# open nvim dotfiles in editor -- temp
alias n='cd ~/.dotfiles/config/.config/nvim ; vim'
# shorthand for nvim
alias v='vim'
# shortcut to dot files
alias dot='cd ~/.dotfiles'
# todo
alias td='todo'
# alias xdg-open to open.
alias open='xdg-open'
# take screenshot
alias tss='gnome-screenshot -a'
# open settings
alias settings='xfce4-display-settings & disown'
# go to React project directory
alias react='cd ~/dev/react'
# go to development directory
alias dev='cd ~/dev'
# NAND2TETRIS:
# add nand2tetris tools to PATH environment
# PATH=$PATH:/home/natkiypie/cs271/nand2tetris/tools/ && export path
# open ecs hardware simulator
# alias hsim='HardwareSimulator.sh'
# change to nand2tetris dir
#alias n2t='cd ~/cs271/nand2tetris'
# CAPTURE THE FLAG
alias natas='cd ~/hack/otw/natas/'
# CODE FELLOWS
# go to 201 directory
alias 201='cd ~/dev/cf/js/201/curriculum'
# go to 301 directory
alias 301='cd ~/dev/cf/js/301/curriculum'
# go to playground directory to use Quokka repl and play with code
alias play='cd ~/dev/playground'
# MongoDB
# start mongo daemon
alias mongodb='sudo systemctl start mongod'
# show mongo daemon status
alias mongodb='sudo systemctl status mongod'
# Misc
# free up a port
alias freeport='echo $(pass master/natkiypie) | sudo -S fuser -k 3000/tcp'
# go to scripts directory
alias scripts='cd ~/.scripts'
# alias goodbye script
alias bye=goodbye.sh
# set external monitor on only
alias exmon=ex_mon_only_on.sh
# set external monitor
alias setex=ex_mon_on.sh
# pull down code fellow git repository diffs
alias updatecc=update_code_fellows_git_repos.sh
# for lua language server
alias luamake=/home/natkiypie/.dotfiles/nvim/lua-language-server/3rd/luamake/luamake
