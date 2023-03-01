/*Author : Maxswell Diniz
Técnico em informática
Linguagem base C++*/


Para configurar uma redundância de tráfego de dados usando dois switches e dois cabos, você pode configurar uma tecnologia de agregação de link chamada Link Aggregation Control Protocol (LACP). O LACP permite que você configure vários links físicos em um único link lógico, aumentando a largura de banda e fornecendo redundância.

Aqui está um exemplo de como configurar a redundância de tráfego de dados usando dois switches e dois cabos:

Conecte um cabo de rede do primeiro switch à porta 1 e outro cabo de rede à porta 2.
Conecte um cabo de rede do segundo switch à porta 1 e outro cabo de rede à porta 2.
No primeiro switch, configure as portas 1 e 2 para formar um LACP com o segundo switch. Use o seguinte comando:
scss


Switch1(config)# interface range gigabitEthernet 0/1 - 2
Switch1(config-if-range)# channel-group 1 mode active
No segundo switch, configure as portas 1 e 2 para formar um LACP com o primeiro switch. Use o seguinte comando:
scss


Switch2(config)# interface range gigabitEthernet 0/1 - 2
Switch2(config-if-range)# channel-group 1 mode active
Verifique se o link está funcionando corretamente usando o seguinte comando:
sql


Show running-config
Com essas configurações, você terá dois cabos que funcionam juntos para aumentar a largura de banda e fornecer redundância. Se um cabo falhar, o outro assumirá a carga de tráfego sem interrupção no fluxo de dados.