<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="com.universidad.mvc.model.Producto" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <title>Formulario</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/estilos.css">

</head>

<body>

<%
    Producto producto =
            (Producto) request.getAttribute("producto");

    boolean editando =
            producto != null;
%>

<div class="contenedor-formulario">

    <h1>

        <%= editando
                ? "Editar Producto"
                : "Registrar Producto" %>

    </h1>

    <form method="post"
          action="${pageContext.request.contextPath}/productos">

        <input type="hidden"
               name="accion"
               value="<%= editando ? "actualizar" : "guardar" %>">

        <%
            if (editando) {
        %>

        <input type="hidden"
               name="id"
               value="<%= producto.getId() %>">

        <%
            }
        %>

        <label>

            Nombre

            <input type="text"
                   name="nombre"
                   required
                   value="<%= editando ? producto.getNombre() : "" %>">

        </label>

        <label>

            Categoría

            <input type="text"
                   name="categoria"
                   value="<%= editando ? producto.getCategoria() : "" %>">

        </label>

        <label>

            Precio

            <input type="number"
                   step="0.01"
                   min="0"
                   name="precio"
                   required
                   value="<%= editando ? producto.getPrecio() : "" %>">

        </label>

        <label>

            Stock

            <input type="number"
                   min="0"
                   name="stock"
                   required
                   value="<%= editando ? producto.getStock() : "" %>">

        </label>

        <div class="acciones">

            <button type="submit">

                <%= editando
                        ? "Actualizar"
                        : "Guardar" %>

            </button>

            <a class="btn-cancelar"
               href="${pageContext.request.contextPath}/productos">

                Cancelar
            </a>

        </div>

    </form>

</div>

</body>
</html>