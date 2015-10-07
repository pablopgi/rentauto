package hbQueries

import home.AutoHome
import home.ReservaHome
import home.UsuarioHome
import java.util.Date
import model.Reserva
import model.Ubicacion

class ReservaParaUsuario {
   	  //Crear reserva, agregarla al auto con metodo agregar reserva y persistir con save
	
   def crearReservaParaUsuario(int nroSolicitud, 
   							   Ubicacion ubicacionOrigen, 
   							   Ubicacion ubicacionDestino,
   							   Date fechaInicio,
   							   Date fechaFin,
   							   String patente,
   							   int idUsuario
   ) {
   	
	  val user = new UsuarioHome().get(idUsuario)
	  val automovil = new AutoHome().getPorPatente(patente)
   	
   	  var reserva = new Reserva=>[
   	  	numeroSolicitud = nroSolicitud
   	  	origen = ubicacionOrigen
   	  	destino = ubicacionDestino
   	  	inicio = fechaInicio
   	  	fin = fechaFin
   	  	usuario = user
   	  	auto = automovil
   	  ]
   	  
   	  automovil.agregarReserva(reserva)
   	  user.agregarReserva(reserva)
   	  
      new ReservaHome().save(reserva)
   }
	
}