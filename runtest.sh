#!/bin/bash

set -euo pipefail

sspm_ex="${1:-$PWD/sspm}"

global_test_dir=$(mktemp -d -t 'sspm.test.XXXXXXXXXX')
cp -r test "$global_test_dir"

testlist=$(find "$global_test_dir/test" -maxdepth 1 -mindepth 1 -type d | sort)
testlist=($testlist)

for test_name in "${testlist[@]}"; do
	echo "Running $(basename "$test_name")"
	bash "$test_name/test" "$sspm_ex"
done
