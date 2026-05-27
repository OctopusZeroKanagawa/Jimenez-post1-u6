<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <title>
        ${empty producto
                ? 'Nuevo Producto'
                : 'Editar Producto'}
    </title>

    <link rel="stylesheet"
          href="<c:url value='/css/estilos.css'/>">

</head>

<body>

<div class="contenedor-formulario">

    <h1>

        ${empty producto
                ? 'Registrar Producto'
                : 'Editar Producto'}

    </h1>

    <form method="post"
          action="<c:url value='/productos'/>">

        <c:if test="${not empty producto}">

            <input type="hidden"
                   name="id"
                   value="${producto.id}">

            <input type="hidden"
                   name="accion"
                   value="actualizar">

        </c:if>

        <c:if test="${empty producto}">

            <input type="hidden"
                   name="accion"
                   value="guardar">

        </c:if>

        <label>

            Nombre

            <input type="text"
                   name="nombre"
                   required
                   value="${producto.nombre}">

        </label>

        <label>

            Categoría

            <input type="text"
                   name="categoria"
                   value="${producto.categoria}">

        </label>

        <label>

            Precio

            <input type="number"
                   name="precio"
                   step="0.01"
                   min="0"
                   required
                   value="${producto.precio}">

        </label>

        <label>

            Stock

            <input type="number"
                   name="stock"
                   min="0"
                   required
                   value="${producto.stock}">

        </label>

        <div class="acciones">

            <button type="submit">

                ${empty producto
                        ? 'Guardar'
                        : 'Actualizar'}

            </button>

            <a class="btn-cancelar"
               href="<c:url value='/productos'/>">

                Cancelar
            </a>

        </div>

    </form>

</div>

</body>

</html>