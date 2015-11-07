package home

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.DynamicLabel
import model.Usuario
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.Direction
import org.neo4j.graphdb.RelationshipType
import model.TipoDeRelaciones

@Accessors
class AmigoHome {
	
	GraphDatabaseService graph

	new(GraphDatabaseService graph) {
		this.graph = graph
	}

	private def personLabel() {
		DynamicLabel.label("User")
	}
	
	def crearNodo(Usuario user) {
		val node = this.graph.createNode(personLabel)
		node.setProperty("nombre", user.nombre)
		node.setProperty("apellido", user.apellido)
		node.setProperty("mail", user.email)
		node.setProperty("userName", user.nombreUsuario)
	}

	def eliminarNodo(Usuario user) {
		val nodo = this.getNodo(user)
		nodo.relationships.forEach[delete]
		nodo.delete
	}

	def getNodo(Usuario user) {
		this.getNodo(user.nombreUsuario)
	}
	
	def getNodo(String userName) {
		this.graph.findNodes(personLabel, "userName", userName).head
	}
	
	def relacionar(Usuario persona1, Usuario persona2, TipoDeRelaciones relacion) {
		val nodo1 = this.getNodo(persona1);
		val nodo2 = this.getNodo(persona2);
		nodo1.createRelationshipTo(nodo2, relacion);
	}
	
	
	private def toUsuario(Node nodo) {
		new Usuario => [
			nombreUsuario = nodo.getProperty("userName") as String
			nombre = nodo.getProperty("nombre") as String
			apellido = nodo.getProperty("apellido") as String
			email = nodo.getProperty("mail") as String
		]
	}

	def getAmigos(Usuario user) {
		val nodoUsuario = this.getNodo(user)
		val nodoAmigos = this.nodosRelacionados(nodoUsuario, TipoDeRelaciones.AMIGO, Direction.INCOMING)
		nodoAmigos.map[toUsuario].toSet
	}

	
	def getConexiones(Usuario user) {
		this.getAmigos(user).map[getAmigos(it)].flatten.toSet
		//conexiones.map[this.getHijos(it)].flatten.toSet
	}

	protected def nodosRelacionados(Node nodo, RelationshipType tipo, Direction direccion) {
		nodo.getRelationships(tipo, direccion).map[it.getOtherNode(nodo)]
	}
	
}