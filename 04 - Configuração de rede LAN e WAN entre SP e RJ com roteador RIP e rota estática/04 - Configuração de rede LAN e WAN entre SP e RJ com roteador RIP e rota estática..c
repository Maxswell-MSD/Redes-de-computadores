/*Author : Maxswell Sousa Diniz
  Técnico em Informática
  Configuração Básica de Rede LAN, WAN, Protocolo RIP, Clock Rate, Link DCE e DTE.
  13/03/2023
*/




Segue abaixo o script para configuração da rede LAN e WAN, onde a rede DCE está em SP e a rede DTE está no RJ:

Para a configuração da rede LAN e WAN do SP (rede DCE):

enable
configure terminal
hostname SP
exit

configure terminal
interface fa0/1
ip address 192.168.0.1 255.255.255.0
no shutdown
description porta lan SP
wr
show running-config

configure terminal
interface s0/0
ip address 200.100.10.1 255.255.255.0
no shutdown
description porta wan SP
bandwidth 128
clock rate 128000
wr
show running-config

configure terminal
router rip
network 192.168.0.0
network 200.100.10.0

show running-config
show startup-config
copy running-config startup-config
show startup-config
reload

Para a configuração da rede LAN e WAN do RJ (rede DTE):

enable
configure terminal
hostname RJ
exit

configure terminal
interface fa0/1
ip address 10.0.0.1 255.0.0.0
no shutdown
description porta lan RJ

show running-config

configure terminal
interface s0/0
ip address 200.100.10.2 255.255.255.252
no shutdown
description porta wan RJ
bandwidth 128

show running-config

configure terminal
router rip

network 10.0.0.0
network 200.100.10.0

show running-config
show startup-config
copy running-config startup-config
show startup-config
reload

OBS : Depois de Realizar esses procedimentos Coloque o Gateway da rede LAN nas estações.

configure a rota estática da rede do RJ até a porta serial da rede WAN 


configure terminal
ip route 10.0.0.0 255.0.0.0 Serial0/0 
copy running-config startup-config
enable
show ip router

O mesmo procedimento se faz na rede de SP

configure terminal
ip route 192.198.0.0 255.255.0.0 Serial0/0 
copy running-config startup-config
enable
show ip router





