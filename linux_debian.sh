#! /bin/sh
url="AGENT_URL"
filename=$(basename "$url")
workpath=$(dirname $(readlink -f $0))
if (test -f /usr/bin/curl)
then
	curl $url -o $workpath/$filename -s
else
	if (test -f /usr/bin/wget)
	then
		wget -q $url -O $workpath/$filename
	else
		echo "No wget or curl installed, installing curl now"
		sudo apt-get -y install curl
		curl $url -o $workpath/$filename -s
	fi
fi
sudo dpkg --install  $workpath/$filename