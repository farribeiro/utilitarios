Script para fazer deploy de aplicações em modo silent do Windows para caso onde não possível fazer a implementação das aplicações automaticamente

rem start /wait \\10.248.20.2\Utilitarios\UTIL\Lync_2013_PT-BR_WIN-7\PSTools\pskill.exe -accepteula communicator.exe
start /wait msiexec /uninstall \\10.248.20.2\Utilitarios\UTIL\Lync_2013_PT-BR_WIN-7\communicator.msi /quiet /norestart
start /wait msiexec /uninstall \\10.248.20.2\Utilitarios\UTIL\Lync_2013_PT-BR_WIN-7\communicator_PT-BR.msi /quiet /norestart
runas /env /user