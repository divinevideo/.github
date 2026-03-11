#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT_PATH="$ROOT_DIR/scripts/check_mergeability.sh"

fail() {
  echo "FAIL: $1" >&2
  exit 1
}

assert_contains() {
  local haystack="$1"
  local needle="$2"

  if [[ "$haystack" != *"$needle"* ]]; then
    fail "expected output to contain '$needle' but got: $haystack"
  fi
}

load_repo_info() {
  local scenario="$1"
  local output
  output="$(create_repo "$scenario")"
  REPO_DIR="$(printf '%s\n' "$output" | sed -n '1p')"
  REMOTE_REPO="$(printf '%s\n' "$output" | sed -n '2p')"
  HEAD_SHA="$(printf '%s\n' "$output" | sed -n '3p')"
}

create_repo() {
  local scenario="$1"
  local temp_dir
  temp_dir="$(mktemp -d)"
  local remote_repo="$temp_dir/remote.git"
  local work_repo="$temp_dir/work"

  git init --bare "$remote_repo" >/dev/null 2>&1
  git clone "$remote_repo" "$work_repo" >/dev/null 2>&1

  (
    cd "$work_repo"
    git config user.name "Mergeability Test"
    git config user.email "mergeability@example.com"

    printf 'line-one\nline-two\n' > app.txt
    git add app.txt
    git commit -m "base" >/dev/null 2>&1
    git branch -M main
    git push origin main >/dev/null 2>&1

    git checkout -b feature >/dev/null 2>&1

    if [[ "$scenario" == "clean" ]]; then
      printf 'feature-only\n' > feature.txt
      git add feature.txt
      git commit -m "clean feature change" >/dev/null 2>&1
      git push origin feature >/dev/null 2>&1
    else
      printf 'feature-change\nline-two\n' > app.txt
      git add app.txt
      git commit -m "conflicting feature change" >/dev/null 2>&1
      git push origin feature >/dev/null 2>&1

      git checkout main >/dev/null 2>&1
      printf 'main-change\nline-two\n' > app.txt
      git add app.txt
      git commit -m "conflicting main change" >/dev/null 2>&1
      git push origin main >/dev/null 2>&1
      git checkout feature >/dev/null 2>&1
    fi

    echo "$work_repo"
    echo "$remote_repo"
    git rev-parse HEAD
  )
}

test_clean_merge_passes() {
  local output
  load_repo_info clean

  output="$(
    cd "$REPO_DIR" &&
      "$SCRIPT_PATH" origin main "$HEAD_SHA"
  )" || fail "expected clean merge check to pass"

  assert_contains "$output" "can be cleanly merged"
}

test_conflicting_merge_fails() {
  local output
  load_repo_info conflict

  set +e
  output="$(
    cd "$REPO_DIR" &&
      "$SCRIPT_PATH" origin main "$HEAD_SHA" 2>&1
  )"
  local status=$?
  set -e

  if [[ $status -eq 0 ]]; then
    fail "expected conflicting merge check to fail"
  fi

  assert_contains "$output" "cannot be cleanly merged"
}

test_clean_merge_passes_with_shallow_checkout() {
  local shallow_repo output
  load_repo_info clean

  shallow_repo="$(dirname "$REPO_DIR")/shallow"

  git clone --depth 1 --branch feature "file://$REMOTE_REPO" "$shallow_repo" >/dev/null 2>&1

  output="$(
    cd "$shallow_repo" &&
      "$SCRIPT_PATH" origin main "$HEAD_SHA"
  )" || fail "expected shallow clean merge check to pass"

  assert_contains "$output" "can be cleanly merged"
}

main() {
  test_clean_merge_passes
  test_conflicting_merge_fails
  test_clean_merge_passes_with_shallow_checkout
  echo "PASS: check_mergeability_test"
}

main "$@"
