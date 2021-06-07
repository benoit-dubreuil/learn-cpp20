#!/usr/bin/env bash

rm -f -r build/
cmake_presets=$(cmake --list-presets | sed -n '1!p' | grep -E -i -o "[a-zA-Z0-9-]+")

while read -r preset
do
    echo "${preset}"
done <<< "${cmake_presets}"