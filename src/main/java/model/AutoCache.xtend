package model

class AutoCache {
	
	String marca
	String modelo
	Integer anio
	String patente
	Double costoBase
	
	new (Auto auto){
		this.marca = auto.marca
		this.modelo = auto.modelo
		this.anio = auto.anio
		this.patente = auto.patente
		this.costoBase = auto.costoBase
	}
}