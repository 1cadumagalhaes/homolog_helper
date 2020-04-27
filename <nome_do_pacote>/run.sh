echo "Para parar de captar logs, pressione ctrl+C"

trap 'echo "
Execução" parada pelo usuário' 1 2 15

if [ -z "<nome_do_pacote>" ]
then
    echo "Rodando logcat para o log.txt"
    adb logcat -v time -s FA FA-SVC >> log.txt;
    python3 filterevents.py;
    exit;
else
    echo "Rodando logcat para o <nome_do_pacote>.txt"
    if [ -z "" ]
    then 
        adb logcat -v time -s FA FA-SVC >> <nome_do_pacote>.txt; 
        python3 filterevents.py -i <nome_do_pacote>;
        exit;
    else
        adb logcat -v time -s FA FA-SVC >> <nome_do_pacote>.txt;
        python3 filterevents.py -i <nome_do_pacote> -f ;
        exit;
    fi
fi
exit;

