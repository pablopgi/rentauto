package model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.Map
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PerfilDeUsuario {
	@JsonProperty("_id")
	String nombreUsuario;
	String nombre;
	String apellido;
	Map<Privacidad, Set<Calificacion>> calificaciones;

	def agregarCalificacion(Privacidad privacidad, Calificacion calificacion) {
		calificaciones.get(privacidad).add(calificacion);
	}
	
}