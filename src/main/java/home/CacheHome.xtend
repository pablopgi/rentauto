package home

import com.datastax.driver.core.Cluster
import com.datastax.driver.core.Session
import com.datastax.driver.core.BoundStatement
import com.datastax.driver.core.PreparedStatement
import com.datastax.driver.core.Statement
import com.datastax.driver.core.querybuilder.QueryBuilder

class CacheHome {
	
	Cluster cluster
	Session session
	String node;
	
	new (String node){
		createSchema
		this.node = node
	}
	
	def void connect(){
		cluster = Cluster.builder()
    		          .addContactPoint(node)
            	      .build();
		session = cluster.connect()
	}
	
	def void close(){
		if (cluster != null){
			cluster.close
		}
	}
	
	def createSchema(){
		connect
		session.execute("CREATE KEYSPACE IF NOT EXISTS cacheRentauto"
						+ "WITH replication = {'class:'SimpleStrategy','replication_factor':1};"
		)
		session.execute("CREATE TABLE IF NOT EXISTS"
					   +"cacheRentauto.autosCache(auto set<text>, lugar text, fecha text"
					   +"PRIMARY KEY(lugar,fecha));"
		)
		close
	}
	
	def void insert(String auto, String lugar, String fecha){
		connect
		var PreparedStatement statement = session.prepare(
			"UPDATE autosCache (autos)"
					+ "SET VALUES (autos + ?);"
					+ "WHERE lugar = ? AND fecha = ?");
		var BoundStatement boundStatement = new BoundStatement(statement);
		session.execute(boundStatement.bind(auto, lugar, fecha));
		close
	}
	
	def void delete(String auto, String lugar, String fecha){
		connect
		var PreparedStatement statement = session.prepare(
			"UPDATE autosCache (autos)"
					+ "SET VALUES (autos - ?);"
					+ "WHERE lugar = ? AND fecha = ?");
		var BoundStatement boundStatement = new BoundStatement(statement);
		session.execute(boundStatement.bind(auto, lugar, fecha));
		close		
	}
	
	def getAutosCache(String lugar, String fecha){
		connect
		var Statement select = QueryBuilder
									.select()
									.all()
									.from("autosCache")
									.where(QueryBuilder.eq("lugar", lugar))
									.and(QueryBuilder.eq("fecha", fecha));								
		val res = session.execute(select)
		close
		return res.one
	}
	
}