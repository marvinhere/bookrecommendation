# Sistema de recomendación de libros
Este es un sistema que recomienda libros en base a los libros que el usuario haya seleccionado como "Guardado" o en base al perfil del 
libro que el usuario esté visitando.

## Servidor de recomendaciones
El servidor de recomendaciones es una API en FLASK el cual tiene un motor de recomendaciones que utiliza el Filtrado Basado en 
Contenido y el cual está desarrollado en python. Este genera recomendaciones basadas en la portada del libro y/o basadas en el 
resumen del libro. El servidor web (aplicación de laravel) se encarga de elegir que tipo de recomendación quiere generar.

### Uso del servidor de recomendaciones
El servidor de recomendaciónes está diseñado en forma de API utilizando flask.
<br>
Para que este servicio funcione se tienen que transformar los libros guardados en la base de datos a vectores, para ello se utilizan las
siguientes rutas:<br>
1. /transform-cover
2. /transform-summary
<br>
A cada una de estas rutas se le pasan los siguientes datos mediante un HTTP GET:

- apikey (clave privada)

El servidor web se encarga de esta transformación por cada inserción, edición o eliminación de cada libro. En caso de que usted quiera
utilizar únicamente el servidor de recomendaciones para integrarlo en su propio sistema, tiene que realizar un HTTP GET a cada una de estas
rutas por cada inserción, edición o eliminación de cada libro, esperando como respuesta [ OK ]. Si ya cuenta con libros en su base de datos
usted tiene que hacer esto de forma manual una sola vez para que el servidor de aplicaciones tenga vectorizados sus libros.
<br><br>
**Generar Recomendaciones**

1. /recommendation-summary
2. /recommendation-cover
<br>
A cada una de estas rutas se le pasan los siguientes datos mediante un HTTP GET:

- apikey (clave privada)
- data (id del libro a evaluar)
- k (cantidad de recomendaciones a obtener)

La respuesta de cada ruta es un JSON {…} con ids de los k libros recomendados.

## Servidor Web
El servidor web es una aplicación en Laravel que permite al usuario visitar perfiles de libros, leer el resúmen del libro, guardar el 
libro en la librería virtual y ver recomendaciones generadas por el motor de recomendaciones.
### Adaptación
Esta aplicación web puede ser modificada para que usuarios descarguen libros, descarguen libros si son usuarios de pago, compren libros,
etc.
