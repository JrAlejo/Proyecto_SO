
#!/usr/bin/env bash
#
# este script monitorea  el sistema de carga

function sistema_carga1 { cat /proc/loadavg |awk '{print $1}'
}
function sistema_carga5 { cat /proc/loadavg |awk '{print $2}'
}
function sistema_carga15 { cat /proc/loadavg |awk '{print $3}'
}

KEY=TGMKAOPCSU6DHMR1
pack_recv1=$(sistema_carga1)
pack_recv5=$(sistema_carga5)
pack_recv15=$(sistema_carga15)

echo -n "Carga Del Sistema en los minuto: ${pack_recv1} cinco: ${pack_recv5} quince:${pack_recv15}"

curl https://api.thingspeak.com/update?api_key="${KEY}"\&field1="${pack_recv1}"\&field2="${pack_recv5}"\&field3="${pack_recv15}"





