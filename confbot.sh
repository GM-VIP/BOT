#!/bin/bash
SCPresq="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0dNLVZJUC9CT1QvbWFpbi9UZWxlQm90R2VuL3NvdXJjZXM="
SUB_DOM='base64 -d'
bar="\e[0;36m=====================================================\e[0m"

CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
wget -O /etc/ADM-db/BotGen.sh https://raw.githubusercontent.com/GM-VIP/BOT/main/TeleBotGen/sources/BotGen.sh; chmod 777 /etc/ADM-db/BotGen.sh

tr=${id}
check_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
echo "$IP" > /usr/bin/vendor_code
}

function_verify () {
#echo -e "verificando..."
# check_ip
 permited=$(curl -sSL "https://raw.githubusercontent.com/GM-VIP/BOT/main/TeleBotGen/Control/Control-Bot")
  [[ $(echo $permited|grep "${IP}") = "" ]] && {
  clear
  echo -e "\n\n\n\e[31m====================================================="
  echo -e "\e[31m         ¡LA IP $(wget -qO- ipv4.icanhazip.com) NO ESTA AUTORIZADO!\n     SI DESEAS USAR EL BOT-GEN CONTACTE A @GENKEY_BOT\n                       VIA TELEGRAM."
  echo -e "\e[31m=====================================================\n\n\n\e[0m"
  [[ -d /etc/ADM-db ]] && rm -rf /etc/ADM-db
[[ ! -e "/bin/ShellBot.sh" ]] && rm /bin/ShellBot.sh
  exit 1
  } || {
 ### INTALAR VERCION DE SCRIPT
  clear
  echo -e "\n\n\n\e[32m====================================================="
  echo -e "\e[32m        ¡LA IP $(wget -qO- ipv4.icanhazip.com) ESTA AUTORIZADA!\n   AUTORIZADO CORRECTAMENTE PARA EL USO DEL BOT-GEN.\n                   ESPERE PORFAVOR..."
  echo -e "\e[32m=====================================================\n\n\n\e[0m"
  sleep 5
  CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
  v1=$(curl -sSL "https://raw.githubusercontent.com/GM-VIP/BOT/main/Vercion")
  echo "$v1" > /etc/ADM-db/vercion
  echo "@JS_Developer_PY" > ${CIDdir}/resell
  
  }
}

echo -e "verificando..."
check_ip
function_verify

: <<'LIMITE_ANTIGUO'
 lim-bot () {
unset option
clear
echo -e "$bar"
echo -e "  \033[1;37mIngrese el Limite del Bot"
echo -e "$bar"
echo -n "Limite: "
read opcion
echo "$opcion" > ${CIDdir}/limit
echo "$opcion" > /etc/limit
unset PIDGEN
PIDGEN=$(ps aux|grep -v grep|grep "kill_drop.sh")
if [[ ! $PIDGEN ]]; then
	msg -bar
	echo -ne "\033[1;97m Poner en linea KILL ID [s/n]: "
	read bot_ini
	msg -bar
[[ $bot_ini = @(s|S|y|Y) ]] && {

	echo -e "[Unit]
Description=BotGen Service by @ChumoGH
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/bash /etc/ADM-db/sources/kill_drop.sh 
Restart=always
RestartSec=60s
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/btkill.service
	systemctl enable btkill &>/dev/null
	systemctl start btkill &>/dev/null
	msg -bar
	echo -e "\033[1;31m            Bot ID KILL ACTIVADO"
	msg -bar
	}
else
killall kill_drop.sh &>/dev/null
systemctl stop btkill &>/dev/null
systemctl disable btkill &>/dev/null
rm /etc/systemd/system/btkill.service &>/dev/null
clear
msg -bar
echo -e "\033[1;31m            Bot ID KILL fuera de linea"
msg -bar
fi
read -p "Presione Enter para continuar "
bot_gen
}
LIMITE_ANTIGUO

lim-bot () {
  unset option
  clear
  echo -e "$bar"
  echo -e "  \033[1;37mIngrese el Limite del Bot"
  echo -e "$bar"
  echo -n "Limite: "
  read opcion
  echo "$opcion" > ${CIDdir}/limit
  echo "$opcion" > /etc/limit
  unset PIDGEN
  PIDGEN=$(ps aux | grep -v grep | grep "kill_drop.sh")
  if [[ ! $PIDGEN ]]; then
    echo -e "$bar"
    echo -ne "\033[1;97m Poner en linea KILL ID [s/n]: "
    read bot_ini
    echo -e "$bar"
    [[ $bot_ini = @(s|S|y|Y) ]] && {
      echo -e "[Unit]
Description=Limit Control System for Telegram Services
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
User=root
WorkingDirectory=/root
ExecStart=/bin/bash /etc/ADM-db/sources/kill_drop.sh
Restart=always
RestartSec=60s
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/btkill.service

      systemctl enable btkill &>/dev/null
      systemctl start btkill &>/dev/null
      echo -e "$bar"
      echo -e "\033[1;31m            Bot ID KILL ACTIVADO"
      echo -e "$bar"
    }
  else
    killall kill_drop.sh &>/dev/null
    systemctl stop btkill &>/dev/null
    systemctl disable btkill &>/dev/null
    rm /etc/systemd/system/btkill.service &>/dev/null
    clear
    echo -e "$bar"
    echo -e "\033[1;31m            Bot ID KILL fuera de linea"
    echo -e "$bar"
  fi
  read -p "Presione Enter para continuar "
  bot_gen
}

veryfy_fun () {
SRC="/etc/ADM-db/sources" && [[ ! -d ${SRC} ]] && mkdir ${SRC}
unset ARQ
case $1 in
"BotGen.sh")ARQ="/etc/ADM-db/";;
*)ARQ="/etc/ADM-db/sources/";;
esac
mv -f $HOME/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

download () {
clear
echo -e "$bar"
echo -e "\033[1;33mDescargando archivos... "
echo -e "$bar"
cd $HOME
REQUEST=$(echo $SCPresq|$SUB_DOM)
wget -O "$HOME/lista-arq" ${REQUEST}/lista-bot > /dev/null 2>&1
sleep 1s
echo 999 > ${CIDdir}/limit
[[ -e $HOME/lista-arq ]] && {
for arqx in `cat $HOME/lista-arq`; do
echo -ne "\033[1;33mDescargando: \033[1;31m[$arqx] "
wget -O $HOME/$arqx ${REQUEST}/${arqx} > /dev/null 2>&1 && {
echo -e "\033[1;31m- \033[1;32mRecibido!"
[[ -e $HOME/$arqx ]] && veryfy_fun $arqx
} || echo -e "\033[1;31m- \033[1;31mFalla (no recibido!)"
done
 }
[[ -e /root/token ]] && mv /root/token /etc/ADM-db/token 
[[ -e /root/Admin-ID ]] && mv /root/Admin-ID /etc/ADM-db/Admin-ID 
[[ -e /root/User-ID ]] && mv /root/User-ID /etc/ADM-db/User-ID 
echo "CARGANDO PANEL ADMINISTRATIVO..."
 rm $HOME/lista-arq
 read -p "Presiona Enter para continuar"
 bot_gen
}

msj_ind () {

TOKEN="$(cat /etc/ADM-db/token)"
echo -e "$bar"
echo -e "  \033[1;37mIngrese su ID de telegram a Mensajear"
echo -e "$bar"
read -p "ID: " ID 
[[ -z $ID ]] && ID="$(cat /etc/ADM-db/Admin-ID)"
[[ -z $TOKEN ]] && {
	clear
	echo -e "$bar"
	echo -e "\033[1;37m Aun no a ingresado el token\n No se puede enviar ningun mensaje!"
	echo -e "$bar"
	read foo
} || {
	[[ -z $ID ]] && {
		clear
		echo -e "$bar"
		echo -e "\033[1;37m Aun no a ingresado el ID\n No se puede enviar ningun mensaje!"
		echo -e "$bar"
		read foo
	} || {
		MENSAJE="Hola, Mensale de Prueba del BotGen Generador!"
echo -e "$bar"
echo -e "  \033[1;37mINGRESA EL MENSAJE A ENVIAR"
echo -e "$bar"
read -p "TEXTO: " MENSAJE 
echo -e "$bar"
echo -e "  \033[1;37mPEGA RUTA DE IMAGEN"
echo -e "$bar"
read -p "IMG: " img 
#[[ -z $img ]] && img="https://raw.githubusercontent.com/ChumoGH/ChumoGH-Script/master/favi.png"
[[ -z $img ]] && img="/var/www/html/bot_vmess_qr.png"
[[ -z $MENSAJE ]] && MENSAJE="Hola, Mensale de Prueba del BotGen Generador!"
		URL="https://api.telegram.org/bot$TOKEN/sendMessage"
		URG="https://api.telegram.org/bot$TOKEN/sendPhoto"
		curl -s -X POST $URG -F chat_id=$ID -F photo="@$img" #-F caption="<code>New Script @ChumoGH</code>" #-F width="100" -F height="100"
		curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE" &>/dev/null
#		clear
		echo -e "@$img"
		echo -e "$bar"
		echo -e "\033[1;37m Mensaje enviado Exitosamente...!"
		echo -e "$bar"
		read -p "ENTER PARA Continuar"
	}
}

bot_gen
}

respon () {
[[ ! -e /etc/menu_ito ]] && credd=$(cat < /etc/SCRIPT/menu_credito) || credd=$(cat /etc/menu_ito ) 
[[ -e ${CIDdir}/ress ]] && {
echo -e "DESACTIVANDO RESELLER $credd FIJO EN BotGEN"
echo -e "   AHORA SE FIJARA EL NOMBRE DE QUIEN GENERE LA KEY"
read -p "ENTER PARA VOLVER"
rm -f ${CIDdir}/ress 
} || { 
echo -e "ACTIVANDO RESELLER $credd FIJO EN BotGEN"
echo -e "AHORA SE FIJARA $credd EN TODAS LAS KEYS "
read -p "ENTER PARA VOLVER"
touch ${CIDdir}/ress
}
bot_gen
}

ini_token () {
clear
echo -e "$bar"
echo -e "  \033[1;37mIngrese el token de su bot"
echo -e "$bar"
echo -n "TOKEN: "
read opcion
echo "$opcion" > ${CIDdir}/token
echo -e "$bar"
echo -e "  \033[1;32mtoken se guardo con exito!" && echo -e "$bar" && echo -e "  \033[1;37mPara tener acceso a todos los comandos del bot\n  deve iniciar el bot en la opcion 2.\n  desde su apps (telegram). ingresar al bot!\n  digite el comando \033[1;31m/id\n  \033[1;37mel bot le respodera con su ID de telegram.\n  copiar el ID e ingresar el mismo en la opcion 3" && echo -e "$bar"
read foo
bot_gen
}

ini_res () {
clear
echo -e "$bar"
echo -e "  \033[1;37mIngrese el Contacto de ADMIN de su bot"
echo -e "$bar"
echo -n "RESELLER: "
read opction
echo "$opction" > ${CIDdir}/resell
echo -e "$bar"
read foo
bot_gen
}

ini_id () {
clear
echo -e "$bar"
echo -e "  \033[1;37mIngrese su ID de telegram"
echo -e "$bar"
echo -n "ID: "
read opcion
echo "$opcion" > ${CIDdir}/Admin-ID
echo -e "$bar"
echo -e "  \033[1;32mID guardo con exito!" && echo -e "$bar" && echo -e "  \033[1;37mdesde su apps (telegram). ingresar al bot!\n  digite el comando \033[1;31m/menu\n  \033[1;37mprueve si tiene acceso al menu extendido." && echo -e "$bar"
read foo
bot_gen
}

start_bot () {
[[ ! -e "${CIDdir}/token" ]] && echo "null" > ${CIDdir}/token
unset PIDGEN
PIDGEN=$(ps aux|grep -v grep|grep "BotGen.sh")
if [[ ! $PIDGEN ]]; then
screen -dmS teleBotGen ${CIDdir}/BotGen.sh
clear
echo -e "$bar"
echo -e "\033[1;32m                BotGen en linea"
echo -e "$bar"
echo -ne "\033[1;97m Poner en linea despues de un reinicio [s/n]: "
read bot_ini
echo -e "$bar"
[[ $bot_ini = @(s|S|y|Y) ]] && {
	crontab -l > /root/cron
	echo "@reboot screen -dmS teleBotGen ${CIDdir}/BotGen.sh" >> /root/cron
	crontab /root/cron
	rm /root/cron
}
else
killall BotGen.sh
crontab -l > /root/cron
sed -i '/BotGen.sh/ d' /root/cron
crontab /root/cron
rm /root/cron
clear
msg -e "$bar"
echo -e "\033[1;31m            BotGen fuera de linea"
msg -e "$bar"
sleep 3
fi
bot_gen
}

ayuda_fun () {
clear
echo -e "$bar"
echo -e "            \e[47m\e[30m Instrucciones rapidas \e[0m"
echo -e "$bar"
echo -e "\033[1;37m  $(source trans -b pt:${tr} " Es necesario crear un bot en ")\033[1;32m@BotFather "
echo -e "$bar"
echo -e "\033[1;32m1- \033[1;37mEn su apps telegram ingrese a @BotFather"
echo -e "\033[1;32m2- \033[1;37mDigite el comando \033[1;31m/newbot"
echo -e "\033[1;32m3- @BotFather \033[1;37msolicitara que\n   asigne un nombre a su bot"
echo -e "\033[1;32m4- @BotFather \033[1;37msolicitara que asigne otro nombre,\n   esta vez deve finalizar en bot eje: \033[1;31mXXX_bot"
echo -e "\033[1;32m5- \033[1;37mObtener token del bot creado.\n   En \033[1;32m@BotFather \033[1;37mdigite el comando \033[1;31m/token\n   \033[1;37mseleccione el bot y copie el token."
echo -e "\033[1;32m6- \033[1;37mIngrese el token\n   en la opcion \033[1;32m[1] \033[1;31m> \033[1;37mTOKEN DEL BOT"
echo -e "\033[1;32m7- \033[1;37mPoner en linea el bot\n   en la opcion \033[1;32m[2] \033[1;31m> \033[1;37mINICIAR/PARAR BOT"
echo -e "\033[1;32m8- \033[1;37mEn su apps telegram, inicie el bot creado\n   digite el comando \033[1;31m/id \033[1;37mel bot le respondera\n   con su ID de telegran (copie el ID)"
echo -e "\033[1;32m9- \033[1;37mIngrese el ID en la\n   opcion \033[1;32m[3] \033[1;31m> \033[1;37mID DE USUARIO TELEGRAM"
echo -e "\033[1;32m10-\033[1;37mcomprueve que tiene acceso a\n   las opciones avanzadas de su bot."
echo -e "$bar"
read foo
bot_gen
}

bot_conf () {
[[ -e /etc/ADM-db/token ]] && mv /etc/ADM-db/token /root/token
[[ -e /etc/ADM-db/Admin-ID ]] && mv /etc/ADM-db/Admin-ID /root/Admin-ID
check_ip
function_verify
instaled=/etc/ADM-db/sources && [[ ! -d ${instaled} ]] && download
}

msj_prueba () {

TOKEN="$(cat /etc/ADM-db/token)"
ID="$(cat /etc/ADM-db/Admin-ID)"

[[ -z $TOKEN ]] && {
	clear
	echo -e "$bar"
	echo -e "\033[1;37m Aun no a ingresado el token\n No se puede enviar ningun mensaje!"
	echo -e "$bar"
	read foo
} || {
	[[ -z $ID ]] && {
		clear
		echo -e "$bar"
		echo -e "\033[1;37m Aun no a ingresado el ID\n No se puede enviar ningun mensaje!"
		echo -e "$bar"
		read foo
	} || {
		MENSAJE="Hola, Mensale de Prueba del BotGen Generador!"
		URL="https://api.telegram.org/bot$TOKEN/sendMessage"
		curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE" &>/dev/null
		clear
		echo -e "$bar"
		echo -e "\033[1;37m Mensaje enviado Exitosamente...!"
		echo -e "$bar"
		sleep 2
	}
}

bot_gen
}

act-bot () {
echo "Respaldando TOKEN y ADMINISTRADOR" 
[[ -e /etc/ADM-db/token ]] && mv /etc/ADM-db/token /root/token
[[ -e /etc/ADM-db/Admin-ID ]] && mv /etc/ADM-db/Admin-ID /root/Admin-ID
[[ -e /etc/ADM-db/User-ID ]] && mv /etc/ADM-db/User-ID /root/User-ID
rm -rf /etc/ADM-db/sources/gerar_key && download
}


bot_gen () {
clear
unset PID_GEN
CIDdir=/etc/ADM-db && [[ ! -d ${CIDdir} ]] && mkdir ${CIDdir}
PID_GEN=$(ps x|grep -v grep|grep "BotGen.sh")
PID_on=$(ps x|grep -v grep|grep "modelid")
[[ ! $PID_on ]] && PID_on="\033[1;31mOFF" || PID_on="\033[1;32mON"
[[ ! $PID_GEN ]] && PID_GEN="\033[1;31mOFF" || PID_GEN="\033[1;32mON"
[[ -e ${CIDdir}/token ]] && tk="\033[1;32mOK" || tk="\033[1;31mNULL"
[[ -e ${CIDdir}/Admin-ID ]] && adid="\033[1;32mOK" || adid="\033[1;31mNULL"
limcont=$(cat /etc/ADM-db/limit) 
[[ "${limcont}" = "999" ]] && limted="Ilimitado" || limted=$(cat /etc/ADM-db/limit)
echo -e "$bar"
echo -e " \e[1;97m \e[36m>>>>>>  \e[1;31mBOTGEN ✨ \e[1;31mGHOST ✨ \e[0;37m Vers.\e[1;92m[∞ Meta]\e[1;97m \e[36m<<<<<< \e[0m"
echo -e "$bar"
echo -e "\033[1;32m[1] \033[1;36m> \033[1;37m TOKEN DEL BOT $tk "
echo -e "\033[1;32m[2] \033[1;36m> \033[1;37m INICIAR/PARAR BOT $PID_GEN\033[0m"
echo -e "\033[1;32m[3] \033[1;36m> \033[1;37m ID DE USUARIO TELEGRAM  $adid"
echo -e "\033[1;32m[4] \033[1;36m> \033[1;37m CAMBIAR CONTACTO -> $(cat < ${CIDdir}/resell)"
echo -e "\033[1;36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32m[5] \033[1;36m> \033[1;37m MENSAJE DE PRUEBA"
echo -e "\033[1;32m[6] \033[1;36m> \033[1;37m MANUAL DE USO"
echo -e "\033[1;32m[7] \033[1;36m> \033[1;37m AUTORIZAR ID LIMITADO $PID_on"
echo -e "\033[1;36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32m[8] \033[1;36m> \033[1;37m ACTUALIZAR BOTGEN"
echo -e "\033[1;32m[9] \033[1;36m> \033[1;37m APLICAR LIMITE DIARIO  \033[1;32m 『 $limted 』"
echo -e "\033[1;32m[10]\033[1;36m> \033[1;37m APLICAR MENSAJE DE BIENVENIDA DE NO AUTORIZADO"
echo -e "\033[1;36m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32m[11]\033[1;36m> \033[1;37m MSG POR ID"
echo -e "\033[1;32m[12]\033[1;36m> \033[1;37m $rfij"
echo -e "$bar"
echo -e "\e[1;32m[0] \e[36m>\e[0m \e[47m\e[30m << ATRAS "
echo -e "$bar"
echo -n "Opcion: "
read opcion
case $opcion in
0) exit ;;
1) ini_token;;
2) start_bot;;
3) ini_id;;
4) ini_res;;
5) msj_prueba;;
6) ayuda_fun;;
7) source <(curl -sSL https://raw.githubusercontent.com/GM-VIP/BOT/main/bot-permited.sh) ;;
8) act-bot ;;
9) lim-bot ;;
11) msj_ind ;;
12) respon ;;
*) bot_gen;;
esac
}
[[ -e "/etc/ADM-db/sources/gerar_key" ]] || download
bot_gen
#



