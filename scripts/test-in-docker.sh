#!/usr/bin/env bash

# This script is meant to be run in the docker container of sml-test-runner

all_slugs="$*"

exit_code=0

for slug in $all_slugs; do
  rm -rf /solution
  cp -r /exercises/practice/${slug} /solution
  cp /solution/.meta/example.sml /solution/${slug}.sml
  bin/run.sh ${slug} /solution /solution

  results=$(cat /solution/results.json)
  selection=$(echo "$results" | jq -r tostring | grep "{\"version\":1,\"status\":\"pass\"")

  if [ -z $selection ]; then
    echo -e "${slug}: \e[31mFAILED\e[0m\n\n$(echo "$results" | jq -r '.message')\n\n"
    exit_code=1;
  else
    printf "${slug}: \e[32mPASSED\e[0m\n\n";
  fi
done

exit ${exit_code}
