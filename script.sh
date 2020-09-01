#!/bin/bash

current_date="2021-04-02"

for i in {1..1000}
do
    # 1. Add text to file
    echo "update $i" >> test.txt
    
    # 2. Stage changes
    git add .
    
    # 3. Commit with the current date in the loop
    GIT_AUTHOR_DATE="$current_date 12:00:00" \
    GIT_COMMITTER_DATE="$current_date 12:00:00" \
    git commit -m "test env $i"
    
    # 4. Generate a random jump (1 to 3 days)
    random_jump=$((1 + $RANDOM % 10))
    
    # 5. Advance the date
    current_date=$(date -I -d "$current_date + $random_jump days")

    # Optional: Stop if we go past 2026
    if [[ "$current_date" > "2026-02-8" ]]; then
        echo "Reached end of 2026. Stopping."
        break
    fi
done
