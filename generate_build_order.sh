#!/bin/bash

# a script to generate build order based on build-order used in last refresh.
# file_bo - file has build order which had worked in last refresh
# file_input - file having jumbled set of packages needs to be arranged in order for build
# file_output - resultant set of package order as per last Build Sequence

file_bo="build_order"
file_input="rdep"
file_output="build_sequence"

# delete already existing file
$(rm -f $file_output)

# iterate through file "file_bo" and if package is present in unsorted list write to final file
while IFS= read -r line; do
	#echo "$line"

	if grep -Fxq "$line" $file_input; then
		# if found
		echo "Found [$line] in build order"
		echo "$line" >> $file_output
	fi
done < "$file_bo"

echo "Build sequence is generated, check file [$file_output]\n"
