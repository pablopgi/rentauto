package home

import model.Reserva

class ReservaHome {
	def get(int id){
		return SessionManager.getSession().get(typeof(Reserva) ,id) as Reserva
	}

	def save(Reserva r) {
		SessionManager.getSession().saveOrUpdate(r)
	}
}