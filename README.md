# ipforwarder
At every change of IP sends the new address through telegram-send.

This little scripts allows to keep you updated to the IP addresses of all your servers through the use of [telegram-send](https://github.com/rahiel/telegram-send). 

I execute it through cron setting my crontab to:

```
@reboot . ~/opt/ipforwarder/ipforwarder.sh > /dev/null
0 * * * * . ~/opt/ipforwarder/ipforwarder.sh > /dev/null
```

In this way the script executes at every reboot and every hour. 

What this script does is to wait till the server is connected to a router, then asks for the WAN ip address through the API.
https://api.ipify.org/\?format\=txt

If it detects a new IP address it notifies the user, otherwise it doesn't.
The old ip address is stored in the log file. 

Tested on MAC OSX. 
