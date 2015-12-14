package hibernateTesting

import home.SessionManager
import java.util.ArrayList
import java.util.HashSet
import model.Categoria
import model.Empresa
import model.IUsuario
import model.Reserva
import org.junit.After
import org.junit.Before
import org.junit.Test
import services.EmpresaService

class EmpresaMapTest {
	
	EmpresaService service
	Empresa empresa
	
	@Before
	def void setUp(){
		empresa = new Empresa() => [
			cuit = ''
			nombreEmpresa = ''
			valorMaximoPorDia = 0.0
			usuarios = new HashSet<IUsuario> ()
			reservas = new HashSet<Reserva> ()
			categoriasAdmitidas = new HashSet<Categoria>()
			cantidadMaximaDeReservasActivas = 1
		]
		service = new EmpresaService
	}
	
	@Test
	def void persistoLaEmpresa(){
		service.crearEmpresa(empresa)
	}
	
	@After
	def void limpiar() {
	    SessionManager::resetSessionFactory()
	}
	
}