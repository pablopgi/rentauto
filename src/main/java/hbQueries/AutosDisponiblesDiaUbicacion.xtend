package hbQueries

import model.Ubicacion
import java.util.Date
import home.SessionManager
import model.Auto
import java.util.List

class AutosDisponiblesDiaUbicacion {
	
   def cantidadAutosModelo(Date diaInicial,Ubicacion origen) {
      val query = SessionManager::getSession().createQuery(
		"SELECT auto
		 FROM Auto auto 
		 LEFT JOIN auto.reservas reserva
		 WHERE
		(reserva is not null OR auto.ubicacionInicial = :unOrigen) AND
		(reserva is null OR (:unDiaInicial > reserva.fin OR :unDiaInicial < reserva.inicio) AND
		 reserva.destino != :unOrigen )"
      )
      query.setDate("unDiaInicial", diaInicial)
      query.setEntity("unOrigen", origen)
      return query.uniqueResult() as Integer
   }
   
   def listaAutosModelo(Date diaInicial,Ubicacion origen) {
      val query = SessionManager::getSession().createQuery(
		"SELECT auto
		 FROM Auto auto 
		 LEFT JOIN auto.reservas reserva
		 WHERE
		(reserva is not null OR auto.ubicacionInicial = :unOrigen) AND
		(reserva is null OR (:unDiaInicial > reserva.fin OR :unDiaInicial < reserva.inicio) AND
		 reserva.destino != :unOrigen )"
      )
      query.setDate("unDiaInicial", diaInicial)
      query.setEntity("unOrigen", origen)
      return query.list() as List<Auto>
   }
    
}