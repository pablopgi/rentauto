package model

import com.fasterxml.jackson.annotation.JsonProperty
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongojack.ObjectId

@Accessors
class Calificacion {
	
	var String nombreUsuario
	var TipoDeCalificacion tipocalificacion
	var String comentario
	var Privacidad privacidad
	var Auto auto
	@ObjectId
	@JsonProperty("_id")
	var String id
	
	new(){
		
	}
	
	new(String userName, TipoDeCalificacion calificacion, String comentario, Privacidad privacidad, Auto auto){
		this.privacidad = privacidad
		this.tipocalificacion = calificacion
		this.comentario = comentario
		nombreUsuario = userName
		this.auto = auto
	}
	
}