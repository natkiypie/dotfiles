mkfile() { mkdir -p "$(dirname "$1")" && touch "$1" ; }
freeport() { fuser -k -i "$1"/tcp ; }
