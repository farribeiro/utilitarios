systeminfo | findstr instalação
netsh reset winsock
ipconfig /release
ipconfig /renew
arp -d *
nbtstat -R
nbstat -RR
ipconfig /flushdns
ipconfig /registerdns
netsh interface ip delete arpcache
pauseNew-PSDrive –Name “K” –PSProvider FileSystem –Root “\\Note-infra\d” –Persist