package org.grails.ApkCv

import grails.converters.JSON
import org.hibernate.criterion.Order

class MuCVController {


	static allowedMethods = [save: "POST"]
	def index() {
		/*redirect(action: "list", params: params)*/
	}

	def samplePage(){
		flash.message = "default.title.label"
		flash.args = ["First"]
		flash.default = "this is default"
		def experienceInstance=new MuExperience();
	}

	
	def defaultAction = 'list'

	def editJSON = {
		def result
		def message = ""
		def state = "FAIL"
		def id

		// determine our action. Grid will pass a param called "oper"
		switch (params.oper) {
			// Delete Request
			case 'del':
				result = MuEducation.get(params.id)
				if (result) {
					result.delete()
					message = "Education '${result.title}' Deleted"
					state = "OK"
				}
				break;
			// Add Request
			case 'add':
			//result = new MuEducation(params)

				render 'it worked'
				break;
			// Edit Request
			case 'edit':
			// add or edit instruction sent
				result = MuEducation.get(params.id)
				result.properties = params
				break;
		}

		// If we aren't deleting the object then we need to validate and save.
		// Capture any validation messages to display on the client side
		if (result && params.oper != "del") {
			if (!result.hasErrors() && result.save(flush: true)) {
				message = "Education  '${result.title}' " + (params.oper == 'add') ? "Added" : "Updated"
				id = result.id
				state = "OK"
			} else {
				message = "<ul>"
				result.errors.allErrors.each { message += "<li>${messageSource.getMessage(it)}</li>" }
				message += "</ul>"
			}
		}

		//render [message:message, state:state, id:id] as JSON
		def jsonData = [messsage: message, state: state, id: id]
		render jsonData as JSON
	}

	def addEducation = {
		def education = new MuEducation (nameOfSchool:params.nameOfSchool1, degree:params.degree1, fieldOfStudy:params.fieldOfStudy1)
		education.save()


	}


	def listJSON = {
		def sortIndex = params.sidx ?: 'name'
		def sortOrder  = params.sord ?: 'asc'
		def maxRows = Integer.valueOf(params.rows)
		def currentPage = Integer.valueOf(params.page) ?: 1
		def rowOffset = currentPage == 1 ? 0 : (currentPage - 1) * maxRows
		def educations = MuEducation.createCriteria().list(max: maxRows, offset: rowOffset) {
			if (params.nameOfSchool)
				ilike('nameOfSchool', "%${params.nameOfSchool}%")

			if (params.degree)
				ilike('degree', "%${params.degree}%")

			if (params.fieldOfStudy)
				ilike('fieldOfStudy', "%${params.fieldOfStudy}%")

			order((sortOrder=='asc' ? Order.asc(sortIndex) : Order.desc(sortIndex)).ignoreCase())
			/*order(sortIndex, sortOrder).ignoreCase()*/
		}

		def totalRows = educations.totalCount
		def numberOfPages = Math.ceil(totalRows / maxRows)

		def results = educations?.collect {
			[
				cell: [
					it.nameOfSchool,
					it.degree,
					it.fieldOfStudy
				],
				id: it.id
			]
		}

		def jsonData = [rows: results, page: currentPage, records: totalRows, total: numberOfPages]
		render jsonData as JSON
	}
}
