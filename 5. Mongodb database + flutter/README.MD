## Instalando y configurando MongoDB local para usar con Flutter

Descargar e instalar mongodb:
https://www.mongodb.com/try/download/community

Agregar path en caso de querer usarlo en la linea de comandos:
- Probar en cmd: mongo

Si no funciona agregar a la variable path de windows la ruta del binario
- C:\Program Files\MongoDB\Server\4.4\bin (esta ruta puede variar)

Modificar el fichero de configuracion:
- C:\Program Files\MongoDB\Server\4.4\bin\mongod.cfg

y editar la variable "bindIp" con la ip de tu maquina, esto para que funcione desde el emulador android:
  - bindIp: 192.168.1.73 (la ip puede variar segun tu maquina)
  
  
reiniciar el servicio de mongo en el administrador de tareas/servicios

Para consultar o editar datos cuando instalas mongodb te ofrece instalar MongoDBCompass es un entorno grafico para manipular la bd de mongo.
Tambien se puede hacer por via linea de comandos.