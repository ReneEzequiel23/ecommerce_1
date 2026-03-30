/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio;

import java.sql.Date;

/**
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
public class Pedido {
    private int id;
    private Date fecha;
    private String estado;
    private Double total;
    private int usuario_id;
    private int direccion_id;

    public Pedido() {
    }

    public Pedido(int id, Date fecha, String estado, Double total, int usuario_id, int direccion_id) {
        this.id = id;
        this.fecha = fecha;
        this.estado = estado;
        this.total = total;
        this.usuario_id = usuario_id;
        this.direccion_id = direccion_id;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }


    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public int getDireccion_id() {
        return direccion_id;
    }

    public void setDireccion_id(int direccion_id) {
        this.direccion_id = direccion_id;
    }
    
    
}
