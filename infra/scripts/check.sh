#!/bin/bash

inventory=$1

for item in $( cat $inventory  | grep 'ansible_host' | awk -F '=' '{print $2}' ); do
    result_code=$( curl http://$item/health 2>/dev/null)
    echo "$item - $result_code"
done