#!/usr/bin/env sh

echo "Sup Dawg, im Kube Utils."
echo "I operate as a smol sidecar container that is used for:"
echo "  - kubectl commands"
echo "  - croc commands"
echo "  - network debugging"
echo "  - etc"
echo ""
echo ""
echo "Waiting..."

touch wait.txt

cleanup() {
  log "Halting server! Received interrupt!"
  if [[ -n $TAIL_PID ]]; then
    kill "$TAIL_PID"
  fi
}

trap 'cleanup' INT TERM

# shellcheck disable=SC2086
tail -F wait.txt &
export TAIL_PID=$!

# Waiting for logs.
wait $TAIL_PID