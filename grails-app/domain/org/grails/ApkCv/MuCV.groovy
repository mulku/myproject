package org.grails.ApkCv

import org.grails.ApkCv.auth.User;



class MuCV {

	String name
	String surName
	String city
	String country
	String summary
	String title
	String address
	String phoneNumber
	String email
	String twitter
	String facebook
	String website
	String photoURL
	User user
	
	static hasMany  = [certifications : MuCertifications,
		                educations: MuEducation,
						experience : MuExperience,
						interests:MuInterests,
						languages:MuLanguage,
						organizations:MuOrganization,
						personalStatus:MuPersonalStatus,
						projects:MuProjects,
						publications:MuPublications,
						skills:MuSkills
						]


	static constraints = {
	}
}
