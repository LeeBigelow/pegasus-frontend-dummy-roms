#!/bin/bash
for d in */; do
    collection_name="${d%/}"
    collection_dir="$(realpath "$d")"
    echo "$d" >&2
    sed -n "2p;5p" "$d/systeminfo.txt" \
        | tac \
        | sed -e '1s/^/collection: /'  -e '2s/^/shortname: /'
    find "$collection_dir" -name "dummy*" -printf "file: %p\n\n"
done > metadata.pegasus.txt
