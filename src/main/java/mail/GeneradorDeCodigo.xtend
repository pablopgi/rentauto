package mail

import model.Usuario

class GeneradorDeCodigo {
	
	def final generarCodigo(Usuario user){
		user.nombreUsuario.hashCode.toString
	}
	
}