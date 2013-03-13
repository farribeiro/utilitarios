rem Este script tem a intenção de fazer um WOL durante a madrugada e executar um gpupdate /force em todas as maquinas do domínio garantindo a aplicação das politicas mais recentes.


start /wait wuauclt /ResetEulas 
start /wait wuauclt /ResetAuthorization
start /wait wuauclt /DetectNow
start /wait wuauclt /UpdateNow
start /wait runas /user:bradw01\fabio_ribeiro /noprofile "gpupdate /force /boot"
