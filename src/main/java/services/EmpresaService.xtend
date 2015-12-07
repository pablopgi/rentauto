package services

import home.EmpresaHome
import home.SessionManager
import model.Empresa

class EmpresaService {
	def consultarEmpresa(String cuit) {
		SessionManager.runInSession([
			new EmpresaHome().get(cuit)
		])
	}

	def crearEmpresa(Empresa empresa) {
		SessionManager.runInSession([
			new EmpresaHome().save(empresa)
			Empresa
		]);
	}
}