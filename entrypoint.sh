#!/bin/sh

if ! ${WORKING_DIRECTORY+false};
then
	cd ${WORKING_DIRECTORY}
fi

a=`git ls-files '*.md'` && proselint $a
