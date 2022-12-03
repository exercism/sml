#!/usr/bin/env bash

# This script is meant to be run in the docker container of sml-test-runner

all_slugs="$*"

exit_code=0

for slug in $all_slugs; do
  local_exit_code=0

  rm -rf /solution
  cp -r /exercises/practice/${slug} /solution

  # Check the template file for static errors and type inconsistencies with test.sml
  bin/run.sh ${slug} /solution /solution > /dev/null
  mv /solution/results.json /solution/results-template.json
  template_errors=$(jq '.message' /solution/results-template.json | grep "Static Errors")

  # Check if the example solution passes
  cp /solution/.meta/example.sml /solution/${slug}.sml
  bin/run.sh ${slug} /solution /solution > /dev/null
  pass_pattern=$(cat /solution/results.json | jq -r tostring | grep "{\"version\":1,\"status\":\"pass\"")

  errors=""

  if [ -n "$template_errors" ]; then
    errors="Template is faulty:\n$(cat /solution/results-template.json | jq -r '.message')"
    local_exit_code=1;
  fi

  if [ -z "$pass_pattern" ]; then
    errors="${errors}\n\nSolution is incorrect:\n$(cat /solution/results.json | jq -r '.message')"
    local_exit_code=1;
  fi

  if [ $local_exit_code = 0 ]; then
    echo -e "${slug}: \e[32mPASSED\e[0m"
  else
    exit_code=1
    echo -e "${slug}: \e[31mFAILED\e[0m\n\n${errors}\n\n"
  fi
done

exit ${exit_code}
