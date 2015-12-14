package hbQueries

import home.SessionManager
import model.Categoria
import model.Ubicacion
import java.util.Date
import model.Auto
import java.util.List

class AutosDeReserva {
	
   def detalleAutosReservas(Date fechaInicial, Date fechaFinal, Ubicacion origen, Categoria categoria) {
      val query = SessionManager.getSessionFactory().openSession().createQuery(
         "SELECT auto
          FROM Auto auto 
		  LEFT JOIN auto.reservas reserva
          WHERE
         (reserva is not null or auto.ubicacionInicial.nombre = :unOrigen) and
         (reserva is null or (:unDiaInicial > reserva.fin or :fin < reserva.inicio) and
          reserva.destino != :unOrigen ) and
          auto.categoria = :categoria"
      )
      query.setDate("unDiaInicial", fechaInicial)
      query.setDate("fin", fechaFinal)
      query.setString("unOrigen", origen.nombre)
      query.setParameter("categoria", categoria)
      return query.list() as List<Auto>
   }

}