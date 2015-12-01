package gestores

import model.Reserva
import services.CacheService
import model.AutoCache
import services.ReservaService
import model.Ubicacion
import java.util.Date
import hbQueries.AutosDisponiblesDiaUbicacion
import exceptions.AutoNoDisponible

class GestorDeReservas {
	
	CacheService serviceCache
	ReservaService serviceReserva
	
	new() {
		serviceCache = new CacheService()
		serviceReserva = new ReservaService()
	}
	
	def validarDisponibilidadEnCache(Reserva reserva){
		var autos = serviceCache.obtenerAutos(reserva.origen, reserva.inicio)
		if (autos.isEmpty) {
			actualizarCache(reserva.origen,reserva.inicio)
			autos = serviceCache.obtenerAutos(reserva.origen, reserva.inicio)
		}
		autos.contains(new AutoCache(reserva.auto))
	}
	
	def void reservar(Reserva reserva){
		if ( validarDisponibilidadEnCache(reserva)){
			serviceReserva.crearReserva(reserva)
			serviceCache.eliminarAuto(reserva.auto,reserva.origen,reserva.inicio)
		}
		else {
			throw new AutoNoDisponible
		}
	}
	
	def void actualizarCache(Ubicacion lugar, Date fecha){
		var autos = new AutosDisponiblesDiaUbicacion().listaAutosModelo(fecha,lugar)
		serviceCache.guardarAutos(autos,lugar,fecha)
	}
	
}