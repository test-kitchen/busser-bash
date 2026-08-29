#!/usr/bin/env bash
# Not named *_test.sh or *_spec.sh, so busser-bash must never run it. If the
# glob ever widens, this fails the suite loudly.
echo "helper.sh should not have been executed"
exit 1
