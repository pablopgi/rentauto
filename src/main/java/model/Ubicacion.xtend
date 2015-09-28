package model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class Ubicacion {
	int id
	String nombre
	
	new(){
		
	}
	
	new(String nombre){
		this.nombre = nombre
	}
}

@Accessors 
class UbicacionVirtual extends Ubicacion{
	List<Ubicacion> ubicaciones
}
