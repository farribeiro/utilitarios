echo "Rodando o diagnostico"
ClientDiag.exe

echo "Instala Agent mais recente"
WindowsUpdateAgent30.exe /quiet /norestart


echo "Stop, reconfigura e start de serviços"
sc stop wuauserv
sc stop bits
sc config wuauserv start= auto
sc config bits start= auto
sc start wuauserv
sc start bits

echo "Verificar atualizações"
wuauclt /reseteulas 
wuauclt /resetauthorization
wuauclt /detectnow

@echo off
rem start /wait wuauclt /ResetEulas 
rem start /wait wuauclt /ResetAuthorization
rem start /wait wuauclt /DetectNow
rem start /wait wuauclt /UpdateNow
rem start /wait runas /user:bradw01\fabio_ribeiro /noprofile "gpupdate /force /boot"
