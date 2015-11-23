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

	//Agrego un perfil de usuario nuevo
	def agregarPerfil(Usuario user){
		perfiles.insert(user.toPerfil)
	}
	
	//Busco el perfil completo de un usuario por su nombre de usuario
	def buscarPerfil(Usuario user) {
		perfiles.mongoCollection.findOne(DBQuery.is("_id", user.nombreUsuario))
	}

	//Reemplazo el antiguo perfil por el nuevo perfil modificado 
	def updatePerfil(PerfilDeUsuario perfil){
		perfiles.mongoCollection.updateById(perfil.nombreUsuario, perfil)
	}

}