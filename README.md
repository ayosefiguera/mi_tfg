# Proyecto fin de ciclo DAW - App EQlibrum


## Sobre el proyecto

El siguiente proyecto tiene como objetivo desarrollar una aplicación multiplataforma que facilite la conexión entre servicios profesionales de salud mental y pacientes a través de plataformas virtuales.
Para lograr esto, utilizaremos el Framework Flutter, el cual nos permitirá crear una aplicación que sea compatible con diversos sistemas operativos y dispositivos. Además, aprovecharemos la base de datos Firebase y otros servicios como Auth Realtime Engine para garantizar una experiencia fluida y segura.
Con esta tecnología los usuarios podrán instalar la aplicación en cualquier dispositivo, sin importar el sistema operativo que utilicen. Esto asegurará que la aplicación sea accesible y esté disponible para una amplia gama de usuarios.

## USO
### Requisitos
* Instalación del SDK Flutter.

Existen diferentes formas de instalar el SDK Flutter en nuestra maquina linux, pero la mas sencilla es haciendo uso de los paquetes snap

```$ sudo snap install flutter –classic```

Cabe destacar que con este comando instalaremos el lenguaje dart en nuestro sistema.
      
* Android estudio
Android estudio nos permite crear maquinas virtuales además de una gran cantidad de paquetes básicos con los que implementar las aplicaciones.
Podemos descargar Android estudio desde el siguiente enlace, https://developer.android.com/studio/

 * Elegir un IDLE
Visual Studio Code proporciona muchas facilidades para desarrollar en  flutter, siendo una de las mejores opciones para este cometido. Se puede descargar desde https://code.visualstudio.com/

### Servicios de terceros.

* Firebase:
        ◦ Crea una cuenta en Firebase (https://firebase.google.com).
        ◦ Crea un nuevo proyecto en Firebase desde la consola de Firebase.
        ◦ En la configuración del proyecto, encontrarás las credenciales necesarias para conectar la aplicación con Firebase. Esto incluye la API key para Authentication y la URL de la Realtime Database.

* Cloudinary:
        ◦ Regístrate en Cloudinary (https://cloudinary.com)
        ◦ Crea una nueva cuenta o inicia sesión en tu cuenta existente.
        ◦ En la configuración de la cuenta, encontrarás las API keys necesarias para conectarte a Cloudinary y utilizar su servicio de almacenamiento de imágenes en la nube.

* Jitsi-meet:
        ◦ Accede al sitio web de Jitsi-meet (https://jitsi.org/jitsi-meet/) para obtener información sobre cómo utilizar su sala de videollamadas.
        ◦ Si deseas personalizar la integración con tu aplicación, puedes considerar utilizar la versión de Jitsi-meet que se puede implementar en tu propio servidor.

## Pasos instalación

1.- Decargar repositorio.

2.- Añadir carpeta apis en */lib* con los siguiente archivos y datos.

* auth.dart
    ```    class Auth {
    static const String baseUrl = 'identitytoolkit.googleapis.com';
    static const String key = '[API_KEY AUTHENTICATION]';
    }```

* cloudinary_api.dart
```
class CloudinaryData {
  static const String name = '[name]';
  static const String apiKey = '[api]';
  static const String apiSecret = '[api_secret]';
  static const String uploadPreset = '[upload_preset]';
}```

* api_key.dart
``` class FirebaseData {

  static const String url =
      'eqlibrum-896a3-default-rtdb.europe-west1.firebasedatabase.app';
}```

3.- Lanzar la aplicación con el emulador Android.

nota: El sistema a sido desarrollado pensando en dispositivos Android.

## Enlaces del proyecto

https://drive.google.com/drive/folders/1sgFbtOqXGpMV4sj42QvCQ37RdtxbIiE5?usp=sharing
 
## Licencia

[Licencía MIT](https://github.com/ayosefiguera/miTFG/blob/main/LICENSE)

## Autor
 Este proyecto hia sido creado y desarrollado por Ayose Figuera Alfonso.
 


