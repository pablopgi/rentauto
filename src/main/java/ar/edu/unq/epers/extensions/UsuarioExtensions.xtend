package ar.edu.unq.epers.extensions

import model.Usuario
import model.PerfilDeUsuario
import model.Privacidad
import java.util.HashMap
import java.util.Set
import model.Calificacion
import java.util.HashSet

class UsuarioExtensions {

	def static toPerfil(Usuario us) {
		new PerfilDeUsuario => [
			nombreUsuario = us.nombreUsuario
			nombre = us.nombre
			apellido = us.apellido
			calificaciones = new HashMap<Privacidad, Set<Calificacion>>
			calificaciones.put(Privacidad.AMIGOS, new HashSet<Calificacion>)
			calificaciones.put(Privacidad.PUBLICO, new HashSet<Calificacion>)
			calificaciones.put(Privacidad.PRIVADO, new HashSet<Calificacion>)
			]
	}	
}