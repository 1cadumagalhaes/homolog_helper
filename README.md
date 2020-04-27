Projeto para facilitar a captura e filtro de logs do android utilizando adb.

Projeto feito para shell script no linux.

Para executar (no Linux):
1) Salve o arquivo
2) Dê permissão de execução: chmod +x create.sh
3) Execute o arquivo:
```
./create.sh <nome_do_pacote>
```
obs: O nome do pacote é a "url" do aplicativo, normalmente no formato com.app. Pode ser encontrado na playstore.

Isso vai criar a seguinte estrutura: 

- /<nome_do_pacote>
  - setlog.sh
  - disablelog.sh
  - run.sh
  - filterevents.py

Para coletar os logs: 
Para executar (com o celular conectado e o modo de desenvolvedor ativado):
1) Navegue até a pasta criada. Ex: 'cd <nome_do_pacote>'
2) Execute o arquivo setlog.sh. Ex: ./setlog.sh
3) Execute o arquivo run.sh. Ex: ./run.sh <output_do_log> <string_pra_filtrar_linhas> (Os parâmetros são opcionais)
Mais exemplos: 
- `./run.sh //cria o arquivo log.txt e o log_events.txt`
- `./run.sh 'arquivo_de_logs' //cria o arquivo arquivo_de_logs.txt e o arquivo_de_logs_events.txt`
- `./run.sh 'arquivo_de_logs' '(FE)'`

Quando terminar, basta executar o arquivo disablelog.sh para desativar o modo debug. Ex: ./disablelog.sh