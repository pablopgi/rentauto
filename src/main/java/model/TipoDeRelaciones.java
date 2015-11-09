package model;

import org.neo4j.graphdb.RelationshipType;

public enum TipoDeRelaciones implements RelationshipType {
	AMIGO, RECEPTOR, EMISOR
}
