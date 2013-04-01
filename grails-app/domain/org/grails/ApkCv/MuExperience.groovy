package org.grails.ApkCv


class MuExperience {

	String title
	String companyName
	Date workFrom
	Date workTo
	String description
	String companyURL
	String location
	Date creation_date
	boolean currentlyWorking =false;



	static constraints = {
		companyName(nullable:false)
		companyURL(nullable:true)
		location (nullable:true)
		creation_date(nullable:true);
	}
}
