package services

import home.SessionManager
import model.Reserva
import home.ReservaHome

class ReservaService {
	def consultarReserva(int id) {
		SessionManager.runInSession([
			new ReservaHome().get(id)
		])
	}

	def crearReserva(Reserva reserva) {
		SessionManager.runInSession([
			new ReservaHome().save(reserva)
			Reserva
		]);
	}
}