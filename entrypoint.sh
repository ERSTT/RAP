#!/bin/bash

find /app -name "*.py" | while read script; do
    script_dir=$(dirname "$script")
    
    if [ -f "$script_dir/requirements.txt" ]; then
        pip install -r "$script_dir/requirements.txt"
    fi

    (cd "$script_dir" && python "$script") &
done

wait
