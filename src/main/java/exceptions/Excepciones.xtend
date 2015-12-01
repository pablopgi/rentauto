package exceptions

class UsuarioYaExisteException extends Exception{
	
	new(){
		super("El nombre de usuario elegido ya esta en uso")
	}
	
}

class ValidacionException extends Exception{
	
	new(){
		super("Error al validar el codigo. Usuario no encontrado")
	}
		
}

class UsuarioNoExiste extends Exception{
	
	new(){
		super("Usuario inexistente")
	}
		
}

class NuevaPasswordInvalida extends Exception{
	
	new(){
		super("El password ingresado es incorrecto")
	}
		
}
	
class NoPuedeEnviarMail extends Exception{
	
	new(){
		super("Mail no se pudo enviar. Por favor complete los espacios vacios")
	}
	
}	
	
class AutoNoDisponible extends Exception{
	
	new(){
		super("El auto que intenta reservar no se encuentra disponible")
	}	
		
}