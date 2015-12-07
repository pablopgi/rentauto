package hibernateTesting

import org.junit.Before
import model.Usuario
import java.util.Date
import services.UsuarioService

import org.junit.Test
import static org.junit.Assert.*
import model.Reserva
import java.util.ArrayList
import org.junit.After
import home.SessionManager

class UsuarioMapTest {
	
	Usuario user
	UsuarioService service
	int idUsuario
	
	@Before
	def void setUp(){
		user = new Usuario => [
			nombreUsuario = "pepito"
			nombre = "Cosme" 
			apellido = "Fulanito"
			email = "coso@coso.com"
			fechaNacimiento = new Date(1988,9,10)
			password = "1234"
			reservas = new ArrayList<Reserva>()
		]
		service = new UsuarioService
	}
	
	@Test
	def void guardoUnUsuarioEnLaDB(){
		service.crearUsuario(user)
	}
	
	@Test
	def void consultoUnUsuarioGuardado(){
		idUsuario = service.crearUsuario(user).id
		assertEquals(user.nombreUsuario,service.consultarUsuario(idUsuario).nombreUsuario)
	}
	
	@After
	def void limpiar() {
	    SessionManager::resetSessionFactory()
	}
	
}