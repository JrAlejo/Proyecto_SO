#!/usr/bin/env bash
#
# este script monitorea mi estado de disco

function disco_ocupado { df /dev/sda1 | grep "/dev/sda1" |awk '{print $3}'
}
function disco_libre { df /dev/sda1 | grep "/dev/sda1" |awk '{print $4}'
}

KEY=X1YHTDCDMKHI5J12
pack_recv1=$(disco_ocupado)
pack_recv2=$(disco_libre)

echo -n " Espacio de disco ocupado: ${pack_recv1}  libre: ${pack_recv2}"
curl https://api.thingspeak.com/update?api_key="${KEY}"\&field1="${pack_recv1}"\&field3="${pack_recv2}"


