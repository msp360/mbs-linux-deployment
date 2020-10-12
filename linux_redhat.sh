#! /bin/sh
url="$2"
filename=$(basename "$url")
workpath=$(dirname $(readlink -f $0))
curl $url -o $workpath/$filename -s
sudo rpm --install  $workpath/$filename
