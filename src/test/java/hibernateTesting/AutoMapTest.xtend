package hibernateTesting

import model.Auto
import services.AutoService
import org.junit.Before
import org.junit.Test
import model.Categoria
import model.Familiar
import model.Ubicacion

class AutoMapTest {
	
	Auto auto
	AutoService service
	Categoria categoria
	Ubicacion ubicacion
	
	@Before
	def void setUp(){
		categoria = new Familiar=>[nombre="MiCategoria"]
		ubicacion = new Ubicacion("La Plata")
		auto = new Auto("Ford","Focus",2008,"LEE337",categoria,59.99,ubicacion)
		service = new AutoService
	}
	
	@Test
	def void guardoUnAutoEnLaDB(){
		service.crearAuto(auto)
	}
	
}