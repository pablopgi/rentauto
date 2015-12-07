package hibernateTesting

import model.Auto
import services.AutoService
import model.Categoria
import model.Familiar
import model.Ubicacion

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import model.Reserva
import java.util.ArrayList
import org.junit.After
import home.SessionManager

class AutoMapTest {
	
	Auto auto
	AutoService service
	Categoria categoriaTest
	Ubicacion ubicacionTest
	
	@Before
	def void setUp(){
		categoriaTest = new Familiar=>[nombre="MiCategoria"]
		ubicacionTest = new Ubicacion("La Plata")
		auto = new Auto => [
			marca = "Ford"
			modelo = "Focus"
			anio = 2008
			patente = "LEE337"
			categoria = categoriaTest
			costoBase = 59.99
			ubicacionInicial = ubicacionTest
			reservas = new ArrayList<Reserva>()
			]
		service = new AutoService
	}
	
	@Test
	def void guardoUnAutoEnLaDB(){
		service.crearAuto(auto)
	}
	
	@Test
	def void consultoUnAutoGuardado(){
		var int idAuto = service.crearAuto(auto).id
		assertEquals(auto.patente,service.consultarAuto(idAuto).patente)
	}
	
	@After
	def void limpiar() {
	    SessionManager::resetSessionFactory()
	}
	
}