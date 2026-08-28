#!/usr/bin/env bash
# Runs on the machine under test through busser-bash. Exit status is the verdict.
set -euo pipefail

test -n "$(command -v bash)"
echo "busser-bash ran this script"
