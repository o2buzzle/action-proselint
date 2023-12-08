#!/bin/bash

if ! ${WORKING_DIRECTORY+false};
then
	cd ${WORKING_DIRECTORY}
fi

function proselint2githubaction {
	#'README.md:1:10: typography.symbols.curly_quotes Use curly quotes “”, not straight quotes "". Found 11 times elsewhere.'
	# --> ::warning file=README.md,line=1::typography.symbols.curly_quotes Use curly quotes “”, not straight quotes "". Found 11 times elsewhere.

	while read line; do
		local file=${line%%:*}
		local line=${line#*:}
		local column=${line%%:*}
		local message=${line#*:}
		local rule=${message%% *}
		echo "::warning file=$file,line=$line,col=$column::$message"
	done
}

# make the directory safe
git config --global --add safe.directory /github/workspace

a=`git ls-files '*.md'`
echo "Running proselint on $a"
proselint $a | proselint2githubaction
