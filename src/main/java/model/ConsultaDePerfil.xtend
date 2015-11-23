package model

import java.util.Set
import org.eclipse.xtend.lib.annotations.Data

@Data
class ConsultaDePerfil {
	
	String idnombre
	String nombre
	String apellido
	Set<Calificacion> calificaciones
	
}