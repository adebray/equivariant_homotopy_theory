#!/bin/bash

# Installs the hooks provided by gitinfo2.

file=gitinfo2_hook.txt
hooks_dir=.git/hooks/

for dest in post-checkout post-commit post-merge
do
	cp $file $hooks_dir/$dest
	chmod +x $hooks_dir/$dest
done
