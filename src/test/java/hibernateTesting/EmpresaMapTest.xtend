package hibernateTesting

import java.util.ArrayList
import model.Categoria
import model.Empresa
import model.IUsuario
import model.Reserva
import org.junit.Before
import org.junit.Test
import services.EmpresaService
import org.junit.After
import home.SessionManager

class EmpresaMapTest {
	
	EmpresaService service
	Empresa empresa
	
	@Before
	def void setUp(){
		empresa = new Empresa() => [
			cuit = ''
			nombreEmpresa = ''
			valorMaximoPorDia = 0.0
			usuarios = new ArrayList<IUsuario> ()
			reservas = new ArrayList<Reserva> ()
			categoriasAdmitidas = new ArrayList<Categoria>()
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