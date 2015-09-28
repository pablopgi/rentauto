package ar.edu.unq.epers.model

import model.Auto
import model.Categoria
import model.Empresa
import model.Familiar
import model.IUsuario
import model.ServiciosExpuestos
import model.Ubicacion
import model.Usuario
import org.junit.Before

import static org.mockito.Mockito.*
import home.UsuarioLogInHome
import java.util.Date

class AbstractTest {
	protected Auto auto
	protected Categoria categoriaFamiliar
	protected Ubicacion retiro
	protected Ubicacion aeroparque
	protected IUsuario usuarioPrueba
	protected IUsuario usuarioEmpresa
	protected Empresa empresa
	protected UsuarioLogInHome homePrueba
	protected Usuario usuarioRegistro
	protected ServiciosExpuestos servicioExpuesto
	protected Usuario userNuevo

	@Before
	def void setUp() {
		categoriaFamiliar = new Familiar
		retiro = new Ubicacion("Retiro")
		aeroparque = new Ubicacion("Aeroparque")
		auto = new Auto("Peugeot", "505", 1990, "XXX123", categoriaFamiliar, 100D, retiro)

		usuarioPrueba = mock(IUsuario)
		usuarioEmpresa = mock(IUsuario)
		
		empresa = new Empresa => [
			cuit = "30-11223344-90"
			nombreEmpresa = "Empresa Fantasmita"
			cantidadMaximaDeReservasActivas = 2
			valorMaximoPorDia = 1000D
		]
		
		empresa.usuarios.add(usuarioEmpresa)
		
		homePrueba = mock(UsuarioLogInHome)
		usuarioRegistro = mock(Usuario)
		servicioExpuesto = new ServiciosExpuestos(homePrueba)
		
		userNuevo = new Usuario("alquimia",
								"garrapiniada",
								"artesanal",
								"123@gmail.com",
								new Date(1988,9,10),
								"1234")
	}
}
