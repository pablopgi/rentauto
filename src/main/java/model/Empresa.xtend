package model

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class Empresa {
	
	new() {
		
	}
	
	String cuit
	String nombreEmpresa
	
	Set<IUsuario> usuarios 	
	Set<Reserva> reservas

	int cantidadMaximaDeReservasActivas
	Double valorMaximoPorDia
	Set<Categoria> categoriasAdmitidas
	
	def void agregarReserva(Reserva unaReserva){
		unaReserva.validarReserva
		reservas.add(unaReserva)
	}
	
	def validarReserva(Reserva unaReserva){
		if(reservasActivas.size == cantidadMaximaDeReservasActivas )
			throw new ReservaException("No se pueden tener más reservas para esta empresa")
		if(unaReserva.costoPorDia > valorMaximoPorDia)
			throw new ReservaException("El costo por dia excede el maximo de la empresa")
		if(!this.usuarios.contains(unaReserva.usuario))
			throw new ReservaException("El usuario no pertenece a la empresa")
		if(!this.categoriasAdmitidas.empty && !this.categoriasAdmitidas.contains(unaReserva.auto.categoria))
			throw new ReservaException("La categoria no esta admitida por la empresa")
	}
	
	def reservasActivas(){
		reservas.filter[activa]
	}
}