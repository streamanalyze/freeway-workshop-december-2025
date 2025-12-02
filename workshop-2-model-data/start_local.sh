#!/bin/bash

set -eo pipefail

clean_up() {
  exit_code=$?
  if [[ ! ${exit_code} -eq 0 ]]; then
    pkill -9 sa.engine0 || true
  fi
}

trap clean_up EXIT

# Start nameserver
sa.engine -ns >> ns.log 2>&1 &

# Start edges
sa.engine -f ../edges/SA -ew1 > w1.log 2>&1 &
sa.engine -f ../edges/SA -ew2 > w2.log 2>&1 &
sa.engine -f ../edges/SA -ew3 > w3.log 2>&1 &

sa.engine -c central-server -O startup-osql/start_local.osql -o"quit;" || true

pkill -9 sa.engine0 || true
