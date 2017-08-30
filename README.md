# ssh-callback
This script creates a reverse shell using netcat over SSH...

Requirements:
- Access to a remote network (Be aware, attaching a rogue device on a network you do not own can bring about legal and ethical issues. This is a proof-of-concept script)
- A device on which to run this script, either via CRON or rc.local
- A home server that can accept the SSH callback connections using Public/Private keys (RSA, etc)
- SSH client on remote device
- NetCat (nc) on remote device

Here is how I loaded this in my /etc/rc.local file to run at boot time:
<pre>
(
until ping -nq -c3 8.8.8.8; do
  sleep 5
done
#
/bin/bash /root/callback.sh
)&
</pre>
