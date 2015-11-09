package home

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.DynamicLabel
import model.Usuario
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.Direction
import org.neo4j.graphdb.RelationshipType
import model.TipoDeRelaciones
import org.neo4j.graphdb.traversal.Evaluators
import org.neo4j.graphdb.traversal.TraversalDescription

@Accessors
class RedSocialHome {
	
	GraphDatabaseService graph

	new(GraphDatabaseService graph) {
		this.graph = graph
	}

	private def personLabel() {
		DynamicLabel.label("User")
	}
	
	private def msgLabel() {
		DynamicLabel.label("Msg")
	}
	
	def crearNodoUser(Usuario user) {
		val node = this.graph.createNode(personLabel)
		node.setProperty("nombre", user.nombre)
		node.setProperty("apellido", user.apellido)
		node.setProperty("mail", user.email)
		node.setProperty("userName", user.nombreUsuario)
	}
	
	def crearNodoMsg(String body){
		val node = this.graph.createNode(msgLabel)
		node.setProperty("body", body)
		node		
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
	
	def enviarMsg(Usuario persona1, Usuario persona2, String body) {
		val nodo1 = this.getNodo(persona1);
		val nodo2 = this.getNodo(persona2);
		val msg = this.crearNodoMsg(body);
		nodo1.createRelationshipTo(msg, TipoDeRelaciones.EMISOR);
		msg.createRelationshipTo(nodo2, TipoDeRelaciones.RECEPTOR);
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
		val nodoUsuario = this.getNodo(user)
	    val TraversalDescription td = graph.traversalDescription()
	            .breadthFirst()
	            .relationships( TipoDeRelaciones.AMIGO, Direction.OUTGOING )
	            .evaluator( Evaluators.excludeStartPosition() );
	    td.traverse(nodoUsuario).nodes.map[toUsuario].toSet
	}

	protected def nodosRelacionados(Node nodo, RelationshipType tipo, Direction direccion) {
		nodo.getRelationships(tipo, direccion).map[it.getOtherNode(nodo)]
	}
	
}