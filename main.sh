#!/bin/sh
work_dir=$(dirname $0)
api_key=$(cat $work_dir/account.txt | tr "\n" " " | awk '{print $1}')
secret_key=$(cat $work_dir/account.txt | tr "\n" " " | awk '{print $2}')
domain=$(cat $work_dir/account.txt | tr "\n" " " | awk '{print $3}')

public_ip=$(wget -qO - http://myip.ipip.net/ | awk '{print $2}' | tr "：" " " | awk '{print $2}')

url="https://www.cloudxns.net/api2/ddns"
time=$(date -R)
data="{\"domain\":\"${domain}\",\"ip\":\"${public_ip}\",\"line_id\":\"1\"}"
mac=$(echo -n $api_key$url$data$time$secret_key | md5sum | awk '{print $1}')

result=$(curl -s -k -X POST \
			-H "API-KEY:$api_key" \
			-H "API-REQUEST-DATE:$time" \
			-H "API-HMAC:$mac" \
			-H "API-FORMAT:json" \
			-d "$data" \
			$url | grep -v "success")

if  [ ! $result ] ;then
	echo "Update DDNS record success"
else
	echo "Error : debug info"
	echo $result
fi
