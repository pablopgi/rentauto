package ar.edu.unq.epers.model

import org.junit.Test

import static org.mockito.Mockito.*

class ServiciosExpuestosTest extends AbstractTest{
	
	@Test
	def registroDeUsuario(){
		servicioExpuesto.registrarUsuario(userNuevo)
		verify(homePrueba,times(1)).guardarUsuario(userNuevo)
	}

	@Test
	def registroDeUsuarioExistente(){
		when(homePrueba.buscarUsuario("alquimia")).thenReturn(userNuevo)
		try {
			servicioExpuesto.registrarUsuario(userNuevo)
		}
		catch (Exception e){
			verify(homePrueba,times(0)).guardarUsuario(userNuevo)
		}
	}
	
	@Test
	def validacionDeCuentaDeUsuario(){
		
	}
			
}