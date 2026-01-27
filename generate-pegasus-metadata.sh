#!/bin/bash
for d in */; do
    echo "$d" >&2
    sed -n "2p;5p" "$d/systeminfo.txt" \
        | tac \
        | sed -e '1s/^/collection: /'  -e '2s/^/shortname: /'
    find "$d" -name "dummy*" -printf "file: $d%f\n\n"
done > metadata.pegasus.txt
