[[ ! -d /etc/ADM-db ]] && mkdir /etc/ADM-db && idirect="/etc/ADM-db" 
barra="======================================================"
diactual=$(date '+%d-%m-%Y')
echo -e "BIENVENIDO DE NUEVO \n"
echo "$barra"
cat /etc/ADM-db/idtegm
echo $barra
echo -e "Ingresa el ID Telegram! a Autorizar"
read -p ": " idteg
echo -e "Ingresa Dias de Duracion del ID Telegram!"
read -p ": " ddias
echo -e "Ingreso Calculado entrada\n"
echo $barra
echo "Fecha de Ingreso $diactual"
echo $barra
echo "$idteg | $(date '+%d-%m-%Y' -d " +$ddias days")" >> /etc/ADM-db/idtegm
cat /etc/ADM-db/idtegm | awk '{print $1}' >> /etc/ADM-db/User-ID
echo -e "Eliminando Comando de Sesiones Verificables\n"
ps x | grep modelid | grep -v grep |awk '{print $1}' | while read pid; 
do 
echo "$barra"
 echo "Pids $pid Reconstruido"
 kill -9 $pid
 done
echo -e "source <(curl -sSL https://raw.githubusercontent.com/ELITE-MUNDIAL/BOT/main/id-log.sh)" > /etc/ADM-db/modelo.sh && screen -dmS modelid bash /etc/ADM-db/modelo.sh
echo "$barra"
echo -e "Lista de IDs Disponibles \n "
echo "$barra"
cat /etc/ADM-db/idtegm
read -p "Preiona enter para salir" 

