#!/usr/bin/env bash
#
# Este es un Script  que me permite crear un canal en thingsspeak

curl  --header "Content-Type: application/json" --request POST --data '{"api_key":"3QOBGZ10W6DCQJTN","name":"Proyecto_Api_Sever", "field1":"net_output"}'  https://api.thingspeak.com/channels.json
