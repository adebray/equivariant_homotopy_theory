#!/bin/bash

# Uninstalls the gitinfo2 hooks, by marking them not executable.
# Then, removes the input file

hooks_dir=.git/hooks/

for dest in post-checkout post-commit post-merge
do
	chmod -x $hooks_dir/$dest
done

rm .git/gitHeadInfo.gin
