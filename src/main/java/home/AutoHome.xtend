package home

import model.Auto

class AutoHome {
	def get(int id){
		return SessionManager.getSession().get(typeof(Auto) ,id) as Auto
	}

	def save(Auto a) {
		SessionManager.getSession().saveOrUpdate(a)
	}
	
	def getPorPatente(String patente) {
		return SessionManager.getSession().get(typeof(Auto) ,patente) as Auto
	}
	
}