package home

import model.PerfilDeUsuario
import model.Usuario
import mongoDB.Collection
import mongoDB.SistemDB
import org.mongojack.DBQuery
import static extension ar.edu.unq.epers.extensions.UsuarioExtensions.*

class PerfilDeUsuarioHome {

	var Collection<PerfilDeUsuario> perfiles

	new() {
		perfiles = SistemDB.instance().collection(PerfilDeUsuario)
	}

	def void cleanDB() {
		perfiles.mongoCollection.drop
	}

	def agregarPerfil(Usuario user){
		perfiles.insert(user.toPerfil)
	}
	
	def buscarPerfil(Usuario user) {
		perfiles.mongoCollection.findOne(DBQuery.is("_id", user.nombreUsuario))
	}

	def updatePerfil(PerfilDeUsuario perfil){
		perfiles.mongoCollection.updateById(perfil.nombreUsuario,perfil)
	}
	
	
}