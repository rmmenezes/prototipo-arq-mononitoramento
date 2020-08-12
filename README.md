# ARQUITETURA DE MONITORAMENTO PARA SEGURANÇA CIBERNÉTICA DE SISTEMAS INDUSTRIAIS

O objetivo do trabalho é propor e desenvolver uma arquitetura de monitoramento de segurança cibernética para sistemas industriais. Desta forma, foi desenvolvida uma arquitetura de monitoramento para sistemas industriais, que se destaca por ser modular e por facilitar o acoplamento de diferentes dispositivos e tecnologias do setor industrial. A arquitetura contribui com a segurança cibernética em sistemas industriais e em mitigar os danos causados por ciberataques e anomalias.

## Protótipo da Arquitetura de Monitoramento
![alt text](https://github.com/rmmenezes/prototipo-arq-mononitoramento/blob/master/img/prototipo.png?raw=true)

## Monitoramento em Hosts
### Visualização - Mapa global de conexões externas em logs Ossec 
Em situações no qual o alerta gerado pelo Ossec esta relacionado a acessos externos, assim como, conexões HTTP, SSH e FTP, é interessante conhecer a localização física dos dispositivos envolvidos. A visualização revela a localização e o link de conexões entre endereços de origem e destino. Observa-se, no mapa da Figura \ref{fig:mapa_hosts} que grande parte das conexões partem de regiões Norte Americanas com destino a Coreia do Sul. Se for constatado que tais conexões fazem parte de um ataque em massa a uma rede ou dispositivo, uma medida paliativa seria estabelecer uma regra de firewall para bloquear qualquer conexão vinda da região Norte Americana. 
![alt text](https://github.com/rmmenezes/prototipo-arq-mononitoramento/blob/master/img/mapa_hosts.png?raw=true)

## Monitoramento em Rede ModBus/TCP
### Visualização - Fluxo de Comunicação ModBus mestre-escravo
O modelo de comunicação do protocolo ModBus é do tipo (mestre-escravo), no qual somente o dispositivo master pode realizar as requisições de dados aos dispositivos slaves. A visualização permite observar o fluxo de comunicação existente entre os dispositivos da rede industrial ModBus. Assim, podemos deduzir que no conjunto de dados utilizado, o endereço IP "141.81.0.10" é o dispositivo master, e que recebe todo fluxo de dados dos dispositivos slaves. Uma possível anomalia poderia ser identificado caso algum dispositivo slave passa-se a responder a um servidor master malicioso.
![alt text](https://github.com/rmmenezes/prototipo-arq-mononitoramento/blob/master/img/fluxosmb.png?raw=true)

## Monitoramento em Rede TCP/IP
### Visualização - Fluxo de rede temporal
A Figura exibe uma visualização de séries temporais, na qual é relacionado o tempo pela quantidade de tráfego de rede TCP e UDP. A distribuição da quantidade de pacotes pelo tempo pode contribuir para identificar anomalias de desvios comportamentais. Por exemplo, ataques cibernéticos que geram grandes fluxos de pacotes podem ser facilmente identificados em tal visualização.
![alt text](https://github.com/rmmenezes/prototipo-arq-mononitoramento/blob/master/img/timelion.png?raw=true)


## Repositório de Arquivos de Teste
Este repositório público contém registros de log e captura de tráfego de rede. Tais documentos podem ser utilizados para análise e estudo porém não há nenhuma classificação direta dos dispositivos e características dos arquivos. O conjunto de arquivos neste repositório é uma coleção de diversos arquivos coletados em sites e outros repositório espalhados pela Internet.

Link => https://github.com/rmmenezes/logsNetworksHosts
