<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Inventario</title>
</head>

<body>

<h1>Inventario</h1>

<p>Total productos:</p>

${productos.size()}

<table border="1">

    <tr>
        <th>ID</th>
        <th>Nombre</th>
    </tr>

    <c:forEach var="p" items="${productos}">

        <tr>
            <td>${p.id}</td>
            <td>${p.nombre}</td>
        </tr>

    </c:forEach>

</table>

</body>
</html>