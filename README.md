# Proyecto_SO

En este proyecto encontraremos la elaboracion de varios scripts, que nos ayudan a elaborar un proyecto conjuto que consta en capturar datos de un apisever 
que es "ayshare" y en forma remota subirlos a la plataforma thisgspeaks. como llevaremos acabo este proyecto por medio de vagrant y Virtual crearemos 
un vagrantFile de recursos pequeños que nos ayude con la captura de datos en api server y la subida de datos a thisgspeak de forma remota con crontab -e

al descargar estos archivosencontraremos carpetas como:

     1.MaquinaVirtual
     2.Thisgspeak
     3.RecursosMv
     4.Apiserve
     5.Crontab -e


1. MaquinaVirtual:

 En esta carpeta encontraremos el Vagrantfile que utilizamos en la creacion de este mi proyecto.
 
 paso para crearla ejecutamos:
 
     nano Vagrantfile
     #copiamos lo datos que estas en el vagrantfile de la carpeta
     vagrant up #encendemos vagrant
     vagrant ssh #y la incializamos
 
 2.Thisgspeak:
 
 En esta carpeta encontraremos cuatro scripts que se utilizan para la creacion canales, la forma de limpiarla informacion acumulada que tenemos,
 para ver que informacion tenemos en nuestro thisgspeak  y como se envia un dato cualquiera a la pagina thisgspeak que nos ayudara para la subida de 
 cualquier dato que queramos subir.
 
 a continuacion se vera los scripts:
 
     borrardatos.sh  
     crearcanales.sh
     enviadatos.sh
     infocanales.sh
     
nota: tener encuenta para la ejecucion de un scripts primero se le habilitan los permisos y depues se ejecuta

    chmod +x infocanales.sh # se habilita
    ./infocanales.sh # se ejecuta
    ./infocanales.sh | jq | less # se ejecuta con una mejor lectura.
    
 3.RecursosMv:
 
 En esta carpeta encontraremos 3 scripts que se ultizan pa la toma de datos de recursos de maquina virtual como el sistema de carga, espacio en ram,
 espacio en disco.es decir se selecionaron 3 recursos de nuestra maquina virtual el cual se planteo monitorio el sistema de cargar que se ejecuta con 
 el comando w, top o cat /proc/loadavg., el cual se tomaran los datos en los ultimo 1,5,15,el espacio de ram que se ejecuta con el comando free y 
 el espacio en disco que se ejecuta con el comando df. 
 
 Ademas cabe decir que estos scripts que se crearon que al momento de ejecutarlos individual van a ejecutar la captura del dato, lo muestra en pantalla 
 para ver si el dato es real al comando que estamos tomando el dato, y se va subir a thispeaks.
 
 a continuacion se vera los scripts:
 
    sistemadecarga.sh
    ram.sh
    disco.sh
  
  4.Apisever
  
  En esta carpeta encontraremos 3 scripts que utilizamos para la toma de nuestro dato en ayshare " ayshare es una plataforma que hace publicaciones en 
  forma conjunta,es decir queremos hacer una publicacion y queremos subirla en diferentes redes sociales com instagram, facebook, pinterest, tiwertt 
  entre otras, entonces para no subir una por una, lo que hacemos es crear una sola publicacion y ayshare lo que hace es que nos la publica en todas 
  las redes sociales que queremos que aparezca nuestra publicacion".
  
  Entoces el dato que vamos a capturar de ayshare va ser la hora que se subio esa publicacion. con el scripts serverinfo.sh "nos va mostrar la informacion
  que hay en nuestro ayshare" y con el scripts enviainfo.sh va a capturar ese dato con el que ademas lo que va hacer es subir ese dato a thisgpeak.
  
  Ademas contamos con scripts muy importante que se llama control.sh en el cual lo que se hizo fue la unficacion de todos los scripts que queremos subir
  a la plataforma de thisgspeak de forma automatica o almomento que encendamos nuestra maquina virtual.
  
  a continuacion se vera los scripts:
  
     serverinfo.sh
     enviainfo.sh
     control.sh #este scripts es importante al momento de modificar de la automatizacion del los datos.
  
  5. crontab -e
 
  El comando crontab se utiliza en sistemas UNIX para programar la ejecución de otros comandos, es decir, para automatizar tareas. Podemos ver los 
  crontabs que stán programados y también editarlos, lógicamente.
  
  La programacion se hace mediante 5 asteriscos seguidos del comando a ejecutar.
  
     * * * * * /home/vagrant/scrpits.sh
  
  #De izquierda a derecha, los asteriscos representan:
  
    Minutos: de 0 a 59.
    Horas: de 0 a 23.
    Día del mes: de 1 a 31.
    Mes: de 1 a 12.
    Día de la semana: de 0 a 6, siendo 0 el domingo.
 
  en nuestro programa ejecutamos:
  
     contrab -e
lo que haremos a continucion ejecutar el comando cada un minuto y que ejecute  el comando control.sh
    
    # es decir que lo colocamos asi:
    * * * * * /home/vagrant/Apisever/control.sh
    
  
  
