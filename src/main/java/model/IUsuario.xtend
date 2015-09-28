package model

import java.util.List

interface IUsuario {
	def void agregarReserva(Reserva unaReserva)
	def List<Reserva> getReservas()
}