/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio;

import java.util.List;

/**
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
public class SolicitudPedido {
    private String metodoPago;
    private List<ProductoCarrito> detalles;

    public SolicitudPedido() {
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public List<ProductoCarrito> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<ProductoCarrito> detalles) {
        this.detalles = detalles;
    }
    
    
}
