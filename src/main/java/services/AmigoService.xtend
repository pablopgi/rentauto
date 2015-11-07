package services

import org.neo4j.graphdb.GraphDatabaseService
import home.AmigoHome
import model.Usuario
import model.TipoDeRelaciones

class AmigoService {
	private def createHome(GraphDatabaseService graph) {
		new AmigoHome(graph)
	}

	def eliminarUsuario(Usuario user) {
		GraphServiceRunner::run[
			createHome(it).eliminarNodo(user)
			null
		]
	}

	def agregarUsuario(Usuario user) {
		GraphServiceRunner::run[
			createHome(it).crearNodo(user); 
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
}