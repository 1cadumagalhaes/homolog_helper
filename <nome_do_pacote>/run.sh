echo "Para parar de captar logs, pressione ctrl+C";

trap 'echo "
Execução" parada pelo usuário' 1 2 15

if [ -z "$1" ]
then
    ./setlog.sh;
    echo "Rodando logcat para o log.txt"
    adb logcat -v time -s FA FA-SVC >> log.txt;
    python3 filterevents.py;
    exit;
else
    ./setlog.sh
    echo "Rodando logcat para o $1.txt"
    if [ -z "$2" ]
    then 
        adb logcat -v time -s FA FA-SVC >> $1.txt; 
        python3 filterevents.py -i $1;
        exit;
    else
        adb logcat -v time -s FA FA-SVC >> $1.txt;
        python3 filterevents.py -i $1 -f $2;
        exit;
    fi
fi

./disablelog.sh;
exit;



