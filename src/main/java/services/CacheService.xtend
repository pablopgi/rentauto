package services

import com.google.gson.Gson
import home.CacheHome
import java.util.List
import model.AutoCache
import model.Auto
import java.util.Date
import model.Ubicacion
import org.joda.time.format.DateTimeFormat

class CacheService {
		
	CacheHome home
	Gson gson
	
	new (){
		home = new CacheHome("localhost")
		gson = new Gson
	}
	
	def autosCacheToJson(List<Auto> autos){
		autos.map[gson.toJson(new AutoCache(it))]
	}
	
	def autoCacheToJson(AutoCache auto){
		gson.toJson(auto)
	}
	
	def ubicacionToJson(Ubicacion lugar){
		gson.toJson(lugar)
	}
	
	def convertDate(Date fecha){
		DateTimeFormat.forPattern("dd/MM/yyyy").print(fecha.getTime)
	}
	
	def void guardarAuto(Auto auto, Ubicacion lugar, Date fecha){
		home.insert(autoCacheToJson(new AutoCache(auto)),ubicacionToJson(lugar),convertDate(fecha))
	}
	
	def void guardarAutos(List<Auto> autos, Ubicacion lugar, Date fecha){
		autos.forEach[guardarAuto(it,lugar,fecha)]
	}

	def void eliminarAuto(Auto auto, Ubicacion lugar, Date fecha){
		home.delete(autoCacheToJson(new AutoCache(auto)),ubicacionToJson(lugar),convertDate(fecha))
	}	
	
	def obtenerAutos(Ubicacion lugar, Date fecha){
		var autos = home.getAutosCache(ubicacionToJson(lugar),convertDate(fecha)).getSet("auto",String)
		autos.map[gson.fromJson(it, AutoCache)].toList
	}
	
}