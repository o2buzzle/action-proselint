#!/bin/sh

if ! ${WORKING_DIRECTORY+false};
then
	cd ${WORKING_DIRECTORY}
fi

# make the directory safe
git config --global --add safe.directory /github/workspace

a=`git ls-files '*.md'` && proselint $a
