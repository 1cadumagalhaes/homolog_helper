echo "Para parar de captar logs, pressione ctrl+C"

trap 'echo "
Execução" parada pelo usuário' 1 2 15

if [ -z "$1" ]
then
    echo "Rodando logcat para o log.txt"
    ./setlog.sh;
    adb logcat -v time -s FA FA-SVC GAv4-SVC >> log.txt;
    python3 filterevents.py;
    ./disablelog.sh
    exit;
else
    echo "Rodando logcat para o $1.txt"
    if [ -z "" ]
    then 
    	./setlog.sh;
        adb logcat -v time -s FA FA-SVC GAv4-SVC >> $1.txt; 
        python3 filterevents.py -i $1;
        ./disablelog.sh
        exit;
    else
    	./setlog.sh
        adb logcat -v time -s FA FA-SVC GAv4-SVC >> $1.txt;
        python3 filterevents.py -i $1 -f $2;
        ./disablelog.sh
        exit;
    fi
fi
./disablelog.sh
exit;


