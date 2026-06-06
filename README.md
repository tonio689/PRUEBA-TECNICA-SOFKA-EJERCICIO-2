# PRUEBA TÉCNICA SOFKA - EJERCICIO 2

## Descripción

Este proyecto contiene la automatización de pruebas de los servicios REST de Demoblaze utilizando Karate Framework y Maven.

Servicios evaluados:

* Signup: https://api.demoblaze.com/signup
* Login: https://api.demoblaze.com/login

## Casos de prueba implementados

1. Crear un nuevo usuario en Signup.
2. Intentar crear un usuario ya existente.
3. Login con credenciales correctas.
4. Login con credenciales incorrectas.

## Tecnologías utilizadas

* Java 17
* Maven 3.9.x
* Karate Framework 1.4.1
* JUnit 5

## Estructura del proyecto

src/test/java

* KarateTest.java
* features/

  * demoblaze-api.feature

## Consideraciones de diseño

Para evitar dependencias de datos existentes en el ambiente de pruebas, se implementó la generación dinámica de usuarios mediante el uso de la función:

java.lang.System.currentTimeMillis()

Esto permite crear usuarios únicos en cada ejecución.

## Ejecución

### 1. Verificar Java

java -version

### 2. Verificar Maven

mvn --version

### 3. Ejecutar las pruebas

mvn test

## Reportes

Al finalizar la ejecución, Karate genera automáticamente reportes HTML en:

target/karate-reports/

Archivo principal:

karate-summary.html

También se puede observar en el navegador el archivo feature.demoblaze-api.html 

## Evidencias

Las evidencias incluyen capturas de:

* Request enviado al servicio.
* Response recibido.
* Código HTTP retornado.
* Reporte HTML generado por Karate.


