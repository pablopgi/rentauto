package hibernateTesting

import hbQueries.AutosDeReserva
import hbQueries.AutosDisponiblesDiaUbicacion
import home.SessionManager
import java.util.Date
import model.Auto
import model.Familiar
import model.Reserva
import model.Ubicacion
import model.Usuario
import org.joda.time.DateTime
import org.junit.After
import org.junit.Before
import org.junit.Test
import services.AutoService
import services.ReservaService

import static org.junit.Assert.*
import model.Categoria

class HbQuerysTest {
	
	Reserva reservaFocus
	Reserva reservaPalio
	ReservaService serviceReserva
	AutoService serviceAuto
	Categoria categoriaAuto
	Auto autoFocus
	Auto autoPalio
	
	@Before
	def void setUp(){
		categoriaAuto = new Familiar=>[nombre="MiCategoria"]
		val ubicacionFocus = new Ubicacion("La Plata")
		val ubicacionPalio = new Ubicacion("Varela")
		autoFocus = new Auto("Ford","Focus",2008,"LEE337",categoriaAuto,59.99,ubicacionFocus)
		autoPalio = new Auto("Fiat","Palio",2015,"OST678",categoriaAuto,99.99,ubicacionPalio)
		val user = new Usuario("pepito","Cosme","Fulanito","pepito@coso.com",new Date(1988,10,9),"12340")
		
		reservaFocus = new Reserva =>[
			numeroSolicitud = 11
			origen = ubicacionFocus
			destino = new Ubicacion("La Plata")
			inicio = new DateTime().withDayOfMonth(1).withMonthOfYear(10).withYear(2016).toDate
			fin = new DateTime().withDayOfMonth(9).withMonthOfYear(10).withYear(2016).toDate
			auto = autoFocus
			usuario = user
		]
		
		reservaPalio = new Reserva =>[
			numeroSolicitud = 12
			origen = ubicacionPalio
			destino = new Ubicacion("Varela")
			inicio = new DateTime().withDayOfMonth(1).withMonthOfYear(10).withYear(2016).toDate
			fin = new DateTime().withDayOfMonth(2).withMonthOfYear(10).withYear(2016).toDate
			auto = autoPalio
			usuario = user
		]
		
		autoFocus.agregarReserva(reservaFocus)
		autoPalio.agregarReserva(reservaPalio)
		
		serviceReserva = new ReservaService
		serviceAuto = new AutoService
		
		serviceAuto.crearAuto(autoFocus)
		serviceAuto.crearAuto(autoPalio)
		//serviceReserva.crearReserva(reservaFocus)
		//serviceReserva.crearReserva(reservaPalio)
	}
	
	@Test
	def void consultoLosAutosDisponiblesEnQuilmesElDia11DOctubreDe2015(){
		var AutosDisponiblesDiaUbicacion query = new AutosDisponiblesDiaUbicacion()
		assertEquals(1, query.cantidadAutosModelo(new DateTime().withDayOfMonth(10).withMonthOfYear(10).withYear(2016).toDate, new Ubicacion("La Plata")))
	}
	
	@Test
	def void consultoUnAutoDisponibleParaReservar(){
		var AutosDeReserva query = new AutosDeReserva()
		val queryRes = query.detalleAutosReservas(
			new DateTime().withDayOfMonth(15).withMonthOfYear(10).withYear(2016).toDate,
			new DateTime().withDayOfMonth(20).withMonthOfYear(10).withYear(2016).toDate,
			new Ubicacion("Varela"),
			categoriaAuto
		)
		assertEquals(autoPalio.id,queryRes.get(0).id)
	}
	
	@Test
	def void unUsuarioCreaUnaReserva(){
		
	}
	
	@After
	def void limpiar() {
	    SessionManager::resetSessionFactory()
	}
	
}