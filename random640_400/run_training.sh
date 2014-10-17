#!/bin/bash 

#in Caffe
if [[ -z "$1" ]]; then
	echo "error: need solver file"
else
	../../.build_release/tools/caffe train --solver=$1
fi
