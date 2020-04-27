if [ -z "$1" ]
then
    echo "Passe o nome do pacote do app como parametro:"
    echo "./create.sh <package_name> "
else

echo "Criando ambiente para homologação via logs do app" $1;

mkdir $1;
touch $1/setlog.sh;
echo "adb shell setprop debug.firebase.analytics.app " $1 > $1/setlog.sh;
echo "adb shell setprop log.tag.FA VERBOSE
adb shell setprop log.tag.FA-SVC VERBOSE" >> $1/setlog.sh;

touch $1/disablelog.sh;
echo "adb shell setprop debug.firebase.analytics.app .none." > $1/disablelog.sh;

touch $1/run.sh;

cat >> $1/run.sh <<EOL
echo "Para parar de captar logs, pressione ctrl+C"

trap 'echo "
Execução" parada pelo usuário' 1 2 15

if [ -z "\$1" ]
then
    echo "Rodando logcat para o log.txt"
    adb logcat -v time -s FA FA-SVC >> log.txt;
    python3 filterevents.py;
    exit;
else
    echo "Rodando logcat para o \$1.txt"
    if [ -z "\$2" ]
    then 
        adb logcat -v time -s FA FA-SVC >> \$1.txt; 
        python3 filterevents.py -i \$1;
        exit;
    else
        adb logcat -v time -s FA FA-SVC >> \$1.txt;
        python3 filterevents.py -i \$1 -f \$2;
        exit;
    fi
fi
exit;

EOL

cat >> $1/filterevents.py <<EOL

import sys,getopt

def main(argv):
    inputfile = 'log'
    wordtofilter='Logging event (FE)'
    try:
        opts, args = getopt.getopt(argv,"hi:f:",["ifile=","filter="])
    except getopt.GetoptError:
        print('filterevents.py -i <inputfile> -f <filterstring>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('filterevents.py -i <inputfile> -f <filterstring>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-f", "--filter"):
            wordtofilter = arg
    
    outputfile = inputfile+'_events'
    inputfile,outputfile=inputfile+'.txt',outputfile+'.txt'
    print('Filtrando linhas com '+wordtofilter+' do arquivo '+inputfile+' para '+outputfile)
    open(outputfile,'w').writelines(line for line in open(inputfile) if wordtofilter in line)

if __name__ == "__main__":
   main(sys.argv[1:])

EOL

cd $1;
chmod +x setlog.sh && chmod +x disablelog.sh && chmod +x run.sh;

echo "Para executar (com o celular conectado e o modo de desenvolvedor ativado):
1) Navegue até a pasta criada. Ex: 'cd $1'
2) Execute o arquivo setlog.sh. Ex: ./setlog.sh
3) Execute o arquivo run.sh. Ex: ./run.sh <arquivo de output do log> <string pra filtrar as linhas> (Os parâmetros são opcionais)
Mais exemplos: 
- ./run.sh //cria o arquivo log.txt e o log_events.txt
- ./run.sh 'arquivo_de_logs' //cria o arquivo arquivo_de_logs.txt e o arquivo_de_logs_events.txt
- ./run.sh 'arquivo_de_logs' '(FE)'

Quando terminar, basta executar o arquivo disablelog.sh para desativar o modo debug. Ex: ./disablelog.sh
"

fi
exit;