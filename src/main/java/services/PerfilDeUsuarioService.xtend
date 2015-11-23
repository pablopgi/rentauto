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
			                                reserva.numeroSolicitud, 
			                                calificacion, 
			                                comentario, 
			                                privacidad)

		val perfil = home.buscarPerfil(user)
		
		perfil.agregarCalificacion(privacidad, calif)
		home.updatePerfil(perfil)
	}

	def consultarPerfil(Usuario usuarioActual, Usuario usuarioDestino) {
		
		val perfil = home.buscarPerfil(usuarioDestino)
		val calificaciones = perfil.calificaciones.get(Privacidad.PUBLICO)

		if (usuarioActual == usuarioDestino) {
			calificaciones.addAll(perfil.calificaciones.get(Privacidad.AMIGOS))
			calificaciones.addAll(perfil.calificaciones.get(Privacidad.PRIVADO))
		}

		if ((new RedSocialService).esAmigoDe(usuarioActual, usuarioDestino)) {
			calificaciones.addAll(perfil.calificaciones.get(Privacidad.AMIGOS))
		}
		buscarPerfil(usuarioDestino).to_consulta(calificaciones)
		
	}

}