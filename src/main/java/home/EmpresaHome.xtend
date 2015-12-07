package home

import model.Empresa

class EmpresaHome {
	def get(String cuit){
		return SessionManager.getSession().get(typeof(Empresa) ,cuit) as Empresa
	}

	def save(Empresa e) {
		SessionManager.getSession().saveOrUpdate(e)
	}
}