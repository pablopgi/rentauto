package home

import model.Usuario

class UsuarioHome {
	def get(int id){
		return SessionManager.getSession().get(typeof(Usuario) ,id) as Usuario
	}

	def save(Usuario user) {
		SessionManager.getSession().saveOrUpdate(user)
	}
}