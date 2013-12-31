package springapp.service;

import org.apache.log4j.Logger;

public class NewProducto {
	
	/** Logger for this class and subclasses */
	static final Logger logger = Logger.getLogger(NewProducto.class.getName());
	private String descripcion;
	private double precio;
	private int id;
	
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
