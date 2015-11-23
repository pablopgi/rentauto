package services

import model.Usuario
import model.Reserva
import model.Calificacion
import model.Privacidad
import model.TipoDeCalificacion
import home.PerfilDeUsuarioHome

class PerfilDeUsuarioService {

	def home() {
		new PerfilDeUsuarioHome
	}

	def buscarPerfil(Usuario user) {
		home.buscarPerfil(user)
	}

	def agregarPerfil(Usuario user) {
		home.agregarPerfil(user)
	}

	def agregarCalificacion(Reserva reserva, 
		                    Usuario user, 
		                    TipoDeCalificacion calificacion, 
		                    Privacidad privacidad, 
		                    String comentario) {
		val calif = new Calificacion(user.nombreUsuario, 
									 calificacion, 
									 comentario, 
									 privacidad, 
									 reserva.auto)

		val perfil = home.buscarPerfil(user)
		
		perfil.agregarCalificacion(privacidad, calif)
		home.updatePerfil(perfil)
	}

	def consultarPerfil(Usuario usuarioActual, Usuario usuarioDestino) {

		//Busco todo el perfil del usuario que quiero
		val perfil = home.buscarPerfil(usuarioDestino)
		val calificaciones = perfil.calificaciones.get(Privacidad.PUBLICO)

		//Consulta de perfil propio
		if (usuarioActual == usuarioDestino) {
			calificaciones.addAll(perfil.calificaciones.get(Privacidad.AMIGOS))
			calificaciones.addAll(perfil.calificaciones.get(Privacidad.PRIVADO))
		}
		//Consulta de perfil de amigo
		else if ((new RedSocialService).esAmigoDe(usuarioActual, usuarioDestino)) {
			calificaciones.addAll(perfil.calificaciones.get(Privacidad.AMIGOS))
		}
		calificaciones
	}
}