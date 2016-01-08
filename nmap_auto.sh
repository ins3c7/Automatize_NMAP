#!/bin/bash
#
# nmap.sh
#
# Script procura portas ssh open em ips aleatórios e salva no arquivo iplist.lst
# rodando em loop infinito
#
# ins3ct, Junho 2015
#
#
 
clear
 
while :;
do
        nmap -iR 10000 -T5 -Pn -p22 -v --open -oG nscan.txt
        cat nscan.txt | grep open/ | awk '{print $2}' >> iplist.lst
        sort -d iplist.lst | uniq > filtred.lst
        clear
        echo -n '\n\n\n\n'
        echo "SSH/OPEN Encontrados: " $(wc -l iplist.lst | awk '{print $1}')
        sleep 2
        echo "Lista salva!"
        sleep 1
        rm nscan.txt
done
