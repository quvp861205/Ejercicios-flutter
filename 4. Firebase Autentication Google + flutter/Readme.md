# Como instalar y configurar firebase de google para la consistencia de datos con android

1. Loguearse en firebase con la cuenta de google y crear un proyecto
[Firebase](https://firebase.google.com/?hl=es)

2. Introducir nombre del proyecto: PlatziTripsFlutter

3. Crear un proyecto para android: 
	3.1 Nombre del paquete de Android: com.example.platzi_trips_app
	3.2 "se encuentra en la ruta android/app/src/build.grandle en defaultConfig"
	
4. Sobrenombre de la app: PlatziTripsAndroid
	
5. Generar Certificado de firma SHA-1 de depuracion:
	5.1 "Nota. la llave se encuentra en c:\users\pedro\.android\debug.keystore"
		
	5.2 Instalar jdk de java en: [JDK Java](https://www.oracle.com/mx/java/technologies/javase/javase-jdk8-downloads.html)
		
	5.3 Agregar al path los binarios de java:  entrar a propiedades mi pc / configuracion avanzada del sistema / variables de entorno -> agregar a la variable "path" la ruta donde se instala java "C:\Program Files\Java\jdk-15.0.1\bin"
			
	5.4 Abrir un cmd y solicitar una llave para registrar una huella digital con google: 			keytool -list -v -alias androiddebugkey -keystore c:\users\pedro\.android\debug.keystore
		
	5.5 Te solicita una contraseña: android
				
	5.6 Copiar la clave SHA1 y pegarla en el formulario que estamos llenando de firebase con el titulo Certificado de firma SHA-1 de depuracion (opcional)

#### Las siguientes son configuraciones del proyecto para que funciones con Firebase
	
6. Descargar google-services.json y añadir a nuestro proyecto en android/app/google-services.json
		
7. modificar archivo android/app/src/build.grandle en defaultConfig 
	7.1 en el objeto defaultConfig modificar el minSdkVersion de 16 a 21, ya que firebase no trabaja con versiones anteriores a la 21.
	7.2 agregar al final del archivo: apply plugin: 'com.google.gms.google-services'
	7.3 agregar al objeto defaultConfig: multiDexEnabled true
	
8. modificar el archivo android/build.grandle
	8.1 agregar la objeto json dependencies: classpath 'com.google.gms:google-services:4.3.4'

9. modificar el archivo android/build.properties
	9.1 añadir las líneas:
	android.useAndroidX=true
	android.enableJetifier=true
	compileSdkVersion 29     //O la version mas nueva que se tenga del emulador de android
	targetSdkVersion 29

10. Agregar dependencias de firebase al archivo pubspec.yaml (se pueden buscar (https://pub.dev/packages))
	firebase_auth: ^0.18.4+1
	google_sign_in: ^4.5.6
	firebase_storage: ^5.2.0
	cloud_firestore: ^0.14.4
	
	
# Como instalar y configurar firebase de google para la consistencia de datos con IOS	

Se requiere tener instalado el sistema operativo Os