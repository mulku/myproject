databaseChangeLog = {



	changeSet(author: "uarslan (generated)", id: "1364288944728-4") {
		addColumn(tableName: "mu_experience") {
			column(name: "creation_date", type: "DATETIME") { constraints(nullable: "true") }
		}
	}


	include file: '2013-03-26-initial-database.groovy'
}
