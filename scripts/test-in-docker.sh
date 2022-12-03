#!/usr/bin/env bash

# This script is meant to be run in the docker container of sml-test-runner

all_slugs="$*"

exit_code=0

for slug in $all_slugs; do
  local_exit_code=0

  rm -rf /solution
  cp -r /exercises/practice/${slug} /solution

  # Check the template file for static errors and type inconsistencies with test.sml.
  # Heuristic: Normally tests (failing or not) end with a line like that:
  #   Tests: 15 passed, 0 failed, 0 errored, 15 total
  # In case of syntax or type errors the compiler exits earlier and the line is missing.
  template_result=$(cd /solution && poly -q --error-exit --use test)
  template_pattern=$(echo "$template_result" | grep -E '^Tests:.+passed.+failed.+errored.+total$')

  # Integration test: Check if the example solution passes the tests
  # as run by the sml-test-runner similiarly to a student submitting
  # their solution.
  cp /solution/.meta/example.sml /solution/${slug}.sml
  bin/run.sh ${slug} /solution /solution > /dev/null
  solution_pattern=$(cat /solution/results.json | jq -r tostring | grep "{\"version\":1,\"status\":\"pass\"")

  errors=""

  if [ -z "$template_pattern" ]; then
    errors="Template is faulty:\n${template_result}"
    local_exit_code=1;
  fi

  if [ -z "$solution_pattern" ]; then
    errors="${errors}\n\nSolution is incorrect:\n$(cat /solution/results.json | jq -r '.message')"
    local_exit_code=1;
  fi

  if [ $local_exit_code = 0 ]; then
    echo -e "${slug}: \e[32mPASSED\e[0m"
  else
    exit_code=1
    echo -e "${slug}: \e[31mFAILED\e[0m\n${errors}\n\n"
  fi
done

exit ${exit_code}
