package model;

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date

@Accessors
class Usuario implements IUsuario{
	
	int id
	String nombreUsuario
	String nombre
	String apellido
	String email
	Date fechaNacimiento
	boolean estaValidada
	String codigoValidacion
	String password
	
	List<Reserva> reservas = newArrayList

	//Estructura
	
	new() {
		
	}
	
	new(String nombreUsuario, 
		String nombre, 
		String apellido, 
		String email, 
		Date fechaNacimiento,
		String password) {
			
		this.nombreUsuario = nombreUsuario
		this.nombre = nombre
		this.apellido = apellido
		this.email = email
		this.fechaNacimiento = fechaNacimiento
		this.password = password

		}
		
	def void validar(){
		this.estaValidada = true
	}
	
	override agregarReserva(Reserva unaReserva) {
		reservas.add(unaReserva)
	}
	
	override getReservas() {
		reservas
	}

	}
