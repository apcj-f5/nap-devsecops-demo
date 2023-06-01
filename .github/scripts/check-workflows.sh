#!/usr/bin/env bash

set -e

# Maximum time to wait in seconds (5 minutes)
max_wait_time=300

# Time to wait between each check in seconds
check_interval=10

# Start time of the script
start_time=$(date +%s)

# Function to check if the expected string is returned
check_workflow_completion() {
  local workflow_name=$1

  while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))

    if [[ $elapsed_time -gt $max_wait_time ]]; then
      echo "Timeout reached. Expected string 'completed' not returned within $max_wait_time seconds."
      exit 1
    fi

    echo "$(date): Checking status..."
    response=$(curl --fail -s -L \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $GITHUB_PAT" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "https://api.github.com/repos/apcj-f5/hapi.f5labs.dev/actions/runs?head_sha=$GITHUB_SHA")

    status=$(echo $response | jq -r --arg workflow "$workflow_name" '.workflow_runs[] | select(.name == $workflow) | .status')

    if [[ $status == "completed" ]]; then
      echo "Expected status 'completed' returned."
      break
    fi

    sleep $check_interval
  done

  conclusion=$(echo $response | jq -r --arg workflow "$workflow_name" '.workflow_runs[] | select(.name == $workflow) | .conclusion')

  if [[ $conclusion == "success" ]]; then
    echo "Expected conclusion 'success' returned."
    exit 0
  else
    echo "Expected conclusion 'success' not returned for workflow: $workflow_name"
    exit 1
  fi

}

echo "Checking Semgrep"
check_workflow_completion "Semgrep"

echo "OpenSSF Scorecard"
check_workflow_completion "OpenSSF Scorecard"



# check commit status set by pre-commit
