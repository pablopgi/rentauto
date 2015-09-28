package hibernateTesting

import org.junit.Before
import model.Usuario
import java.util.Date
import services.UsuarioService
import org.junit.Test

class UsuarioMapTest {
	
	Usuario user
	UsuarioService service
	
	@Before
	def void setUp(){
		user = new Usuario("pepito","Cosme", "Fulanito","coso@coso.com",new Date(1988,9,10),"1234")
		service = new UsuarioService
	}
	
	@Test
	def void guardoUnUsuarioEnLaDB(){
		service.crearUsuario(user)
	}
	
}