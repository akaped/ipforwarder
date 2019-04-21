#!/bin/bash

computername=`hostname`
filename="./log"
for next in `cat $filename`; do
    previousip="$next" 
done
echo "$computername Old IP $previousip"

while ! ifconfig en0 | grep -F "active" > /dev/null; do
    sleep 10
done
newip=`curl -s https://api.ipify.org/\?format\=txt`

echo "$computername new IP $newip"

if [ "$newip" != "$previousip" ]
    then
        echo "$computername Ip changed"
        telegram-send "* $computername current $newip"
        echo $newip > ./log
    else
        echo "$computername Ip didnt change"
fi

return 0
