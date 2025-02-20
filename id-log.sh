
funcion_cal () {
sleep 5s
[[ ! -d /etc/ADM-db ]] && mkdir /etc/ADM-db && idirect="/etc/ADM-db" 
barra="#############################"
n=0
diactual=$(date '+%d-%m-%Y')
node=$(cat /etc/ADM-db/idtegm | grep "|" | awk '{print $1}' )
for i in $node
do
diafin=$(cat /etc/ADM-db/idtegm | grep "$i" | awk '{print $3}') 
[[ "${diactual}"="${diafin}" ]] && { 
echo $diactual  >> /root/muestraID
mv /etc/ADM-db/idtegm /etc/ADM-db/tmp
mv /etc/ADM-db/User-ID /etc/ADM-db/testusIDtmp
sed -i "/$diafin/ d" /etc/ADM-db/tmp > /etc/ADM-db/idtegm
echo $barra  >> /root/muestraID
echo "Eliminando  $i el ${diactual} "  >> /root/muestraID
sed -i "/$i/ d" /etc/ADM-db/testusIDtmp > /etc/ADM-db/User-ID
rm -f /etc/ADM-db/tmp
rm -f /etc/ADM-db/testusIDtmp
}
let n++
done
funcion_cal
}
funcion_cal
exit
