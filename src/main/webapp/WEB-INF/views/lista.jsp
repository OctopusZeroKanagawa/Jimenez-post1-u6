
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.universidad.mvc.model.Producto" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <title>Inventario de Productos</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/estilos.css">

</head>

<body>

<div class="contenedor">

    <h1>Inventario de Productos</h1>

    <%
        String mensaje =
                (String) request.getAttribute("mensaje");

        if (mensaje != null) {
    %>

    <div class="mensaje">
        <%= mensaje %>
    </div>

    <%
        }
    %>

    <a class="btn"
       href="${pageContext.request.contextPath}/productos?accion=formulario">

        + Nuevo Producto
    </a>

    <table>

        <thead>

        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
        </tr>

        </thead>

        <tbody>

        <%
            List<Producto> productos =
                    (List<Producto>) request.getAttribute("productos");

            for (Producto p : productos) {
        %>

        <tr>

            <td><%= p.getId() %></td>

            <td><%= p.getNombre() %></td>

            <td><%= p.getCategoria() %></td>

            <td>$<%= p.getPrecio() %></td>

            <td><%= p.getStock() %></td>

            <td>

                <a href="${pageContext.request.contextPath}/productos?accion=editar&id=<%= p.getId() %>">

                    Editar
                </a>

                |

                <a href="${pageContext.request.contextPath}/productos?accion=eliminar&id=<%= p.getId() %>"
                   onclick="return confirm('¿Eliminar producto?')">

                    Eliminar
                </a>

            </td>

        </tr>

        <%
            }
        %>

        </tbody>

    </table>

</div>

</body>
</html>