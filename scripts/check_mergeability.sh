#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <base-remote> <base-ref> <head-sha>" >&2
  exit 2
fi

base_remote="$1"
base_ref="$2"
head_sha="$3"
original_ref="$(git symbolic-ref -q --short HEAD || git rev-parse HEAD)"

cleanup() {
  git merge --abort >/dev/null 2>&1 || true
  git reset --hard --quiet >/dev/null 2>&1 || true
  git checkout --quiet "$original_ref" >/dev/null 2>&1 || true
}

trap cleanup EXIT

# Merge-base detection fails on shallow clones because Git cannot see the shared
# ancestor between the PR head and the base branch.
if [[ "$(git rev-parse --is-shallow-repository)" == "true" ]]; then
  git fetch --unshallow origin >/dev/null 2>&1 || git fetch origin --depth=2147483647 >/dev/null 2>&1
fi

git fetch "$base_remote" "$base_ref" --no-tags >/dev/null 2>&1
git checkout --quiet --detach FETCH_HEAD

set +e
merge_output="$(git merge --no-commit --no-ff "$head_sha" 2>&1)"
merge_status=$?
set -e

if [[ $merge_status -ne 0 ]]; then
  if [[ -n "$merge_output" ]]; then
    echo "$merge_output" >&2
  fi
  echo "This branch cannot be cleanly merged into $base_ref." >&2
  exit 1
fi

echo "This branch can be cleanly merged into $base_ref."
