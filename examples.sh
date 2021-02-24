#!/bin/bash

echo "Nombre:"
read -r name

content=$(wget -q -O - "https://lectortmo.com/library?_page=1&title=${name/ /+}")

echo $content | grep -oP "(?<=<h4 class=\"text-truncate\" title=\").*?(?=\">)" > names.txt

array=()
while read -r line; do
    # Reading each line
    array+=("$line")
done <names.txt

show_menus() {
    n=1
    for line in "${array[@]}"; do
        echo $line
        echo $n
        n=$((n + 1))
    done
}

show_menus

grep -o  "https://lectortmo.com/library/manga/manga/.*?(?=\">)" test.html

