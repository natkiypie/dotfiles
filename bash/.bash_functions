# command to make directory and file
mkfile() { mkdir -p "$(dirname "$1")" && touch "$1" ; }
# *TEMPORARY* quick git wf for nvim config
gcu() { git add . ; git commit -m "$1" ; git checkout main ; git merge update ; git push ; git checkout update ; git status ; }
