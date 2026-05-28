# Sistema CRUD de Inventario de Productos

## Descripción del Proyecto

Este proyecto consiste en el desarrollo de una aplicación web CRUD (Create, Read, Update y Delete) para la gestión de productos de un inventario. La aplicación fue desarrollada siguiendo el patrón de arquitectura MVC (Modelo - Vista - Controlador), utilizando tecnologías Java Web y una base de datos MySQL para el almacenamiento de la información.

El sistema permite registrar, consultar, editar y eliminar productos dentro de un inventario mediante una interfaz web sencilla e intuitiva.

---

# Funcionalidades Implementadas

* Registro de nuevos productos.
* Listado dinámico de productos almacenados.
* Edición de productos existentes.
* Eliminación de productos.
* Validaciones básicas en formularios.
* Conexión a base de datos MySQL mediante JDBC.
* Navegación entre vistas JSP.
* Arquitectura basada en el patrón MVC.

---

# Tecnologías Utilizadas

## Backend

* Java 17
* Jakarta Servlet API
* JSP (Java Server Pages)
* JDBC
* Apache Tomcat 10.1.55

## Frontend

* HTML5
* CSS3

## Base de Datos

* MySQL

## Gestión del Proyecto

* Maven
* Git y GitHub
* IntelliJ IDEA

---

# Estructura del Proyecto

src/
 └── main/
      ├── java/
      │    └── com.universidad.mvc/
      │         ├── controller/
      │         ├── dao/
      │         ├── model/
      │         └── util/
      │
      └── webapp/
           ├── css/
           ├── WEB-INF/
           │     └── views/
           │           ├── lista.jsp
           │           └── formulario.jsp
           └── index.jsp

# Patrón MVC Implementado

## Modelo (Model)

Representa la estructura de los datos y la lógica de negocio del sistema. Incluye las clases relacionadas con los productos y el acceso a datos mediante JDBC.

## Vista (View)

Compuesta por páginas JSP encargadas de mostrar la información al usuario y capturar los datos desde formularios HTML.

## Controlador (Controller)

Implementado mediante Servlets, responsables de recibir las solicitudes HTTP, procesar la lógica correspondiente y redireccionar hacia las vistas.

---


# Dependencias Maven Utilizadas

<dependencies>
    <dependency>
        <groupId>jakarta.servlet</groupId>
        <artifactId>jakarta.servlet-api</artifactId>
        <version>6.0.0</version>
        <scope>provided</scope>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-j</artifactId>
        <version>9.3.0</version>
    </dependency>
    <dependency>
        <groupId>org.glassfish.web</groupId>
        <artifactId>jakarta.servlet.jsp.jstl</artifactId>
        <version>3.0.1</version>
    </dependency>

</dependencies>

---

# Configuración y Despliegue del Proyecto

## Requisitos Previos

Antes de ejecutar el proyecto es necesario tener instalado:

* Java JDK 17
* Apache Tomcat 10
* MySQL Server
* Maven
* IntelliJ IDEA (recomendado)

---

# Pasos para Ejecutar el Proyecto

## 1. Clonar el repositorio

git clone <URL_DEL_REPOSITORIO>

---

## 2. Configurar la base de datos

Crear la base de datos ejecutando el script SQL mostrado anteriormente.

---

## 3. Configurar credenciales MySQL

Modificar los datos de conexión dentro de la clase correspondiente de conexión JDBC:

private static final String URL = "jdbc:mysql://localhost:3306/inventario_db";
private static final String USER = "root";
private static final String PASSWORD = "password";

---

## 4. Cargar dependencias Maven

Desde IntelliJ IDEA:

Maven → Reload Project

O desde terminal:

mvn clean install

---

## 5. Configurar Tomcat

Agregar Apache Tomcat 10 al proyecto y desplegar el artifact:

mvc-productos:war exploded

---

## 6. Ejecutar la aplicación

Iniciar Tomcat y acceder desde el navegador:


http://localhost:8080/mvc-productos/productos

---

# Observaciones Técnicas

Durante el desarrollo se realizaron configuraciones relacionadas con JSTL y Jakarta EE para compatibilidad con Apache Tomcat 10 y Jakarta Servlet API 6.0. Finalmente se implementaron vistas JSP utilizando scriptlets tradicionales para garantizar estabilidad y compatibilidad completa con el entorno de ejecución.

---

# Autor

Andrés Jiménez

Proyecto académico desarrollado para la asignatura de Programación Web.
