
#!/usr/bin/env bash
#
# este script  que monitorea en que tiempo he  hecho publicaciones

function publicacion_fecha { ./serverinfo.sh utc |grep "utc"|awk -F "T" '{print $2}'|awk  -F ":" '{print $1"."$2}'|awk 'NR==1{print $0}'
}

KEY=4I9TW5TQTATB04QO
pack_recv=$(publicacion_fecha)
echo -n "porcentaje de uso de disco: ${pack_recv}"
curl https://api.thingspeak.com/update?api_key="${KEY}"\&field1="${pack_recv}"







