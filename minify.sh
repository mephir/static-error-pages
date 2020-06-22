#!/bin/bash

set -e

#
# Script uses https://www.willpeavy.com/tools/minifier/ I don't think someting more sofisticated is required
#

for i in *.html; do
    echo "Minify $i -> pages/$i"
    curl -s -f -XPOST --data-urlencode "html@$i" https://www.willpeavy.com/tools/minifier/ \
    | sed -n '/<textarea/p' \
    | sed -E 's#.*<textarea[^>]*>(.+)<\/textarea>.*#\1#g; s#<\\/(p|div)>#</\1>#g' > pages/$i
done;
