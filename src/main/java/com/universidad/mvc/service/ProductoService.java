package com.universidad.mvc.service;

import com.universidad.mvc.model.Producto;
import com.universidad.mvc.model.ProductoDAO;

import java.util.List;

public class ProductoService {

    private final ProductoDAO dao =
            new ProductoDAO();

    public List<Producto> obtenerTodos() {

        return dao.findAll();
    }

    public Producto obtenerPorId(int id) {

        return dao.findById(id);
    }

    public void guardar(Producto producto) {

        if (producto.getNombre() == null
                || producto.getNombre()
                .trim()
                .isEmpty()) {

            throw new IllegalArgumentException(
                    "El nombre es obligatorio."
            );
        }

        if (producto.getPrecio() < 0) {

            throw new IllegalArgumentException(
                    "El precio no puede ser negativo."
            );
        }

        dao.save(producto);
    }

    public void actualizar(Producto producto) {

        if (dao.findById(producto.getId()) == null) {

            throw new IllegalArgumentException(
                    "Producto no encontrado."
            );
        }

        dao.update(producto);
    }

    public void eliminar(int id) {

        dao.delete(id);
    }
}