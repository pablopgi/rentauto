package services

import home.RedSocialHome
import model.TipoDeRelaciones
import model.Usuario
import org.neo4j.graphdb.GraphDatabaseService

class RedSocialService {
	private def createHome(GraphDatabaseService graph) {
		new RedSocialHome(graph)
	}

	def eliminarUsuario(Usuario user) {
		GraphServiceRunner::run[
			createHome(it).eliminarNodo(user)
			null
		]
	}

	def agregarUsuario(Usuario user) {
		GraphServiceRunner::run[
			createHome(it).crearNodoUser(user); 
			null
		]
	}

	def amigoDe(Usuario userA, Usuario userB) {
		GraphServiceRunner::run[
			val home = createHome(it);
			home.relacionar(userA, userB, TipoDeRelaciones.AMIGO)
			home.relacionar(userB, userA, TipoDeRelaciones.AMIGO)
		]
	}


	def amigosDe(Usuario user) {
		GraphServiceRunner::run[
			val home = createHome(it);
			home.getAmigos(user)
		]
	}

	def conexiones(Usuario user) {
		GraphServiceRunner::run[
			val home = createHome(it)
			home.getConexiones(user)
		]
	}
	
	def enviarMensaje(Usuario userA, Usuario userB, String cuerpoMensaje){
		GraphServiceRunner::run[
			val home = createHome(it)
			home.enviarMsg(userA, userB, cuerpoMensaje)
		]
	}
}