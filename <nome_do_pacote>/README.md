# Para executar

```sh
./run.sh <arquivo_dos_logs> <palavra_para_filtrar>
```

## Sobre os arquivos

### run.sh <arquivo_dos_logs> <palavra_para_filtrar> 
Parâmetros:
- <arquivo_dos_logs>: por padrão "log.txt";
- <palavra_para_filtrar>: por padrão "Logging event (FE)";
Habilita o logcat com o debug do firebase, executa o logcat enviando para o <arquivo_dos_logs>.txt. Depois executa o script em python para filtrar somente os eventos, criando o <arquivo_dos_logs>_events.txt. Por fim desabilita o debug e limpa as configurações inseridas.

Para executar:
```sh
./run.sh <arquivo_dos_logs> <palavra_para_filtrar>
```

### filterevents.py -i <arquivo_dos_logs> -f <palavra_para_filtrar> 
Parâmetros:
- -i <arquivo_dos_logs>:  por padrão "log.txt";
- -f <palavra_para_filtrar>: por padrão "Logging event (FE)";
Abre o arquivo <arquivo_dos_logs>.txt com os logs e copia as linhas que contém a <palavra_para_filtrar> para o arquivo <arquivo_dos_logs>_events.txt.
O script python tem os mesmos parâmetros opcionais que o run.sh. Para executar, basta usar:
```sh
python filterevents.py -i <arquivo_dos_logs> -f <palavra_para_filtrar>
```

### setlog.sh
Habilita as propriedades do logcat que dizem respeito ao firebase.

### disablelog.sh
Desabilita o debug do firebase no logcat.



## Para execução passo a passo:

```sh
./setlog.sh //habilita o debug
adb logcat -v time -s FA FA-SVC >> output.txt //salva os logs no arquivo. Pressionar ctrl+C quando terminar
python filterevents.py -i 'output'
./disablelog.sh

```