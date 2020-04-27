# Para executar

```sh
$ ./setlog.sh //habilita o debug
$ ./run.sh //liga o logcat e joga a saída pro arquivo log.txt ou 
$ python filterevents.py //cria o log_events.txt, filtrando com base no "Logging event (FE)"
```
ou

```sh
$ ./setlog.sh //habilita o debug
$ adb logcat -v time -s FA FA-SVC >> output.txt 
//alterar a variável inputfile no script filterevents.py para output
$ python filterevents.py //cria o output_events.txt, filtrando com base no "Logging event (FE)"
```

Para alterar o nome do arquivo, basta alterar a variável inputfile no arquivo filterevents.py.

## Sobre os arquivos

### run.sh 
Executa o seguinte comando: 
`adb logcat -v time -s FA FA-SVC >> log.txt`

Para executar:
```sh
./run.sh <arquivo_dos_logs> <palavra_para_filtrar>
```

### filterevents.py 
Filtra o arquivo com nome na variável inputfile usando a variável wordstofilter

### setlog.sh
Habilita as propriedades do logcat que dizem respeito ao firebase.

### disablelog.sh
Desabilita o debug do firebase no logcat.
