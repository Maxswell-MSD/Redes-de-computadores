#####################################################
#          Script de Configuração básica de switch  #
#            Autor: Maxswell Sousa Diniz            #
#               Data: 22/02/2023                    #
#####################################################







# 01 - Guia Técnico de Configuração de nome para Switch :

Acesse o modo privilegiado do switch através do comando "enable".
Entre no modo de configuração global usando o comando "Configure terminal".
Defina um nome para o switch utilizando o comando "hostname" seguido do nome desejado, por exemplo "SW1".
Salve as alterações feitas com o comando "write memory" ou "copy running-config startup-config".

# Guia Técnico de Configuração de nome para Switch:

# Acesse o modo privilegiado do switch através do comando "enable".
enable

# Entre no modo de configuração global usando o comando "Configure terminal".
configure terminal

# Defina um nome para o switch utilizando o comando "hostname" seguido do nome desejado, por exemplo "SW1".
hostname SW1

# Salve as alterações feitas com o comando "write memory" ou "copy running-config startup-config".
write memory



========================================================================================================================



# 02 - Guia Técnico de Configuração de Senha de Login para Switch:

#Acesse o modo de configuração do switch digitando o comando "enable" e inserindo a senha de acesso, caso necessário.
#Digite o comando "COnfigure terminal" para acessar o modo de configuração global.
#Digite o comando "line console 0" para acessar a configuração de senha do console.
#Insira uma senha com segurança usando letras maiúsculas e minúsculas, símbolos e números.
#Digite o comando "login" para solicitar login de senha no console.
#Salve as configurações digitando o comando "end" seguido de "write memory" ou "copy running-config startup-config".



Switch> enable

Switch# configure terminal

Switch(config)# line console 0

Switch(config-line)# password <insira a senha desejada aqui>

Switch(config-line)# login

Switch(config-line)# end

Switch# write memory


/* EXEMPLO:

enable
configure terminal
line console 0
password (insira a senha desejada aqui)
login

*/

##############################################################################################################################


# 03 - CONFIGURANDO SENHA PARA ROOT OU PARA ENTRAR NO MODO DE CONFIGURAÇÃO

enable
configure terminal
enable secret (COLOQUE SENHA)
exit
write memory



# CRIAND UMA VLAN E COLOCANDO NA VLAN ESCOLHIDA O INTERVALO DAS PORTAS


enable
configure terminal
vlan 20
name ADM
interface range fa0/1-10
switchport mode access
switchport access vlan 20
exit
write memory









SHOW RUNNING-CONFIG --PARA VER AS CONFIGURAÇÕES
SHOW VLAN BRIEF -- PARA VERIFICAR AS VLAN


# CRIANDO MODO TRUNK PARA UM SWITCH CONVERSAR EM VLAN DE OUTRO SETOR

ara criar o modo trunk em uma VLAN no console, siga os seguintes passos:

Acesse o modo de configuração do switch com o comando enable.
Digite configure terminalpara entrar no modo de configuração global.
Selecione a porta que será configurada como trunk com o comando interface <nome_da_porta>(por exemplo, interface GigabitEthernet1/0/1).
Configure uma porta como trunk com o comando switchport mode trunk.
Defina quais VLANs serão permitidas na porta trunk com o comando switchport trunk allowed vlan <id_da_VLAN>.
Repita o passo 5 para cada VLAN que deseja permitir na porta trunk.
Saia do modo de configuração da interface com o comando exit.
Salve as configurações com o comando write memoryou copy running-config startup-config.

ENABLE
CONFIGURE TERMINAL
VLAN 20
NAME (ADM)
INT RANGE FA0/1-10
SWITCHPORT ACCESS VLAN 20
SALVE

ENABLE
CONFIGURE TERMINAL
INT G0/1
SWITCHPORT MODE TRUNK -- SÓ APLIQUE O COMANDO EM UM SÓ SWITCH



