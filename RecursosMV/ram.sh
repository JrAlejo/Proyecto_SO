#!/usr/bin/env bash
#
# este script monitorea mi estado de disco

function ram_usada { free Mem | grep "Mem"|awk '{print $3}'
}
function ram_libre { free Mem | grep "Mem"|awk '{print $4}'
}

KEY=X1YHTDCDMKHI5J12
pack_recv1=$(ram_usada)
pack_recv2=$(ram_libre)

echo -n "Espacio De RAM ocupada: ${pack_recv1} libre:  ${pack_recv2} "
curl https://api.thingspeak.com/update?api_key="${KEY}"\&field2="${pack_recv1}"\&field4="${pack_recv2}"



