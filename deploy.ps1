rem Script para fazer deploy de aplicações em modo silent do Windows para caso onde não possível fazer a implementação das aplicações automaticamente

start /wait msiexec %1 /passive /norestart
