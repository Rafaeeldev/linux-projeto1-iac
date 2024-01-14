#!/bin/bash

####################################################################################################
##               Dio.me: Projeto Criação de Estrutura de Usuários, Diretórios e Permissões        ##
## Nome: IAC.sh                                                                                   ##
##                                                                                                ##
## Autor: Rafael Simões                                                                           ##
##                                                                                                ##
## Data: 13/01/2024                                                                               ##
##                                                                                                ##
## Descrição: O script cria usuários, grupos, diretórios e especifica permissão aos diretórios.   ##
##                                                                                                ##
## Uso: Execute como root/superusuário o script ./IAC.sh                                          ##
##                                                                                                ##
####################################################################################################

echo "Criando Diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios.."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizado"
