#!/bin/bash
echo "== list newest buckets"

# https://jqlang.github.io/jq/manual/

aws s3api list-buckets | jq -r '.Buckets | sort_by(.CreationDate) | reverse | .[0:5] | .[] | .Name'
echo "..."
