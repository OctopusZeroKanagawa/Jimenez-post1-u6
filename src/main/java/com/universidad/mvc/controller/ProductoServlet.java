package com.universidad.mvc.controller;

import com.universidad.mvc.model.Producto;
import com.universidad.mvc.service.ProductoService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {

    private final ProductoService service = new ProductoService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {

            case "listar":
                listar(request, response);
                break;

            case "formulario":
                mostrarFormulario(request, response);
                break;

            case "editar":
                mostrarEdicion(request, response);
                break;

            case "eliminar":
                eliminar(request, response);
                break;

            default:
                response.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        if ("guardar".equals(accion)) {

            guardar(request, response);

        } else if ("actualizar".equals(accion)) {

            actualizar(request, response);

        } else {

            response.sendError(400);
        }
    }

    private void listar(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "productos",
                service.obtenerTodos()
        );

        String mensaje = request.getParameter("mensaje");

        if (mensaje != null) {
            request.setAttribute("mensaje", mensaje);
        }

        forward(
                request,
                response,
                "/WEB-INF/views/lista.jsp"
        );
    }

    private void mostrarFormulario(HttpServletRequest request,
                                   HttpServletResponse response)
            throws ServletException, IOException {

        forward(
                request,
                response,
                "/WEB-INF/views/formulario.jsp"
        );
    }

    private void mostrarEdicion(HttpServletRequest request,
                                HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        Producto producto = service.obtenerPorId(id);

        request.setAttribute("producto", producto);

        forward(
                request,
                response,
                "/WEB-INF/views/formulario.jsp"
        );
    }

    private void guardar(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        Producto producto = extraerProducto(request, 0);

        service.guardar(producto);

        response.sendRedirect(
                request.getContextPath()
                        + "/productos?mensaje=Producto+guardado+correctamente"
        );
    }

    private void actualizar(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        Producto producto = extraerProducto(request, id);

        service.actualizar(producto);

        response.sendRedirect(
                request.getContextPath()
                        + "/productos?mensaje=Producto+actualizado"
        );
    }

    private void eliminar(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        service.eliminar(id);

        response.sendRedirect(
                request.getContextPath()
                        + "/productos?mensaje=Producto+eliminado"
        );
    }

    private Producto extraerProducto(HttpServletRequest request,
                                     int id) {

        return new Producto(
                id,
                request.getParameter("nombre"),
                request.getParameter("categoria"),
                Double.parseDouble(
                        request.getParameter("precio")
                ),
                Integer.parseInt(
                        request.getParameter("stock")
                )
        );
    }

    private void forward(HttpServletRequest request,
                         HttpServletResponse response,
                         String ruta)
            throws ServletException, IOException {

        request.getRequestDispatcher(ruta)
                .forward(request, response);
    }
}