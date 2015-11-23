package model

import com.fasterxml.jackson.annotation.JsonProperty
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongojack.ObjectId

@Accessors
class Calificacion {
	
	var String nombreUsuario
	var Integer numeroSolicitud
	var TipoDeCalificacion tipocalificacion
	var String comentario
	var Privacidad privacidad
	@ObjectId
	@JsonProperty("_id")
	var String id
	
	new(){
		
	}
	
	new(String userName, Integer numSol,TipoDeCalificacion calificacion, String comentario, Privacidad privacidad){
		this.privacidad = privacidad
		this.tipocalificacion = calificacion
		this.comentario = comentario
		nombreUsuario = userName
		numeroSolicitud = numSol
	}
	
	override equals(Object obj){
		val otroComentario = obj as Calificacion
		id == otroComentario.id && numeroSolicitud == otroComentario.numeroSolicitud
	}
	
}