#!/usr/bin/env bash

set -e

# Maximum time to wait in seconds (5 minutes)
max_wait_time=300

# Time to wait between each check in seconds
check_interval=10

# Start time of the script
start_time=$(date +%s)

echo "Checking ArgoCD result"
while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))

    if [[ $elapsed_time -gt $max_wait_time ]]; then
        echo "Timeout reached. Expected string 'success' not returned within $max_wait_time seconds."
        exit 1
    fi

    echo "$(date): Checking status..."
    response=$(curl --fail -s -L \
            -H "Accept: application/vnd.github+json" \
            -H "Authorization: Bearer $GITHUB_PAT" \
            -H "X-GitHub-Api-Version: 2022-11-28" \
        "https://api.github.com/repos/apcj-f5/nap-devsecops-demo/commits/$GITHUB_SHA/status")

    state=$(echo $response | jq -r '.statuses[] | select(.context == "ArgoCD") | .state')

    if [[ $state == "success" ]]; then
        echo "Expected state 'success' returned."
        break
    fi

    sleep $check_interval
done
