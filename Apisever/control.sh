#!/usr/bin/env bash
#
# este script monitorea mi estado de disco

function disco_ocupado { df /dev/sda1 | grep "/dev/sda1" |awk '{print $3}'
}
function disco_libre { df /dev/sda1 | grep "/dev/sda1" |awk '{print $4}'
}

function ram_usada { free Mem | grep "Mem"|awk '{print $3}'
}
function ram_libre { free Mem | grep "Mem"|awk '{print $4}'
}


KEY=X1YHTDCDMKHI5J12
pack_recv1disco=$(disco_ocupado)
pack_recv2disco=$(disco_libre)
pack_recv1ram=$(ram_usada)
pack_recv2ram=$(ram_libre)

echo -n " Espacio de disco ocupado: ${pack_recv1disco}  libre: ${pack_recv2disco} espacio De RAM ocupada: ${pack_recv1ram} libre:  ${pack_recv2ram}"
curl https://api.thingspeak.com/update?api_key="${KEY}"\&field1="${pack_recv1disco}"\&field3="${pack_recv2disco}"\&field2="${pack_recv1ram}"\&field4="${pack_recv2ram}"



function sistema_carga1 { cat /proc/loadavg |awk '{print $1}'
}
function sistema_carga5 { cat /proc/loadavg |awk '{print $2}'
}
function sistema_carga15 { cat /proc/loadavg |awk '{print $3}'
}

KEY1=TGMKAOPCSU6DHMR1
pack_recv1=$(sistema_carga1)
pack_recv5=$(sistema_carga5)
pack_recv15=$(sistema_carga15)

echo -n "Carga Del Sistema en los minuto: ${pack_recv1} cinco: ${pack_recv5} quince:${pack_recv15}"

curl https://api.thingspeak.com/update?api_key="${KEY1}"\&field1="${pack_recv1}"\&field2="${pack_recv5}"\&field3="${pack_recv15}"

function publicacion_fecha { ./serverinfo.sh utc |grep "utc"|awk -F "T" '{print $2}'|awk  -F ":" '{print $1"."$2}'|awk 'NR==1{print $0}'
}

KEY2=4I9TW5TQTATB04QO
pack_recv=$(publicacion_fecha)
echo -n "porcentaje de uso de disco: ${pack_recv}"
curl https://api.thingspeak.com/update?api_key="${KEY2}"\&field1="${pack_recv}"
