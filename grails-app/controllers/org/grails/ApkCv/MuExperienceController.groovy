package org.grails.ApkCv


class MuExperienceController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index() {
		//def experienceInstance = new MuExperience()
	}

	def saveMuExperience= {
		def experienceInstance = new MuExperience(params)
		experienceInstance.creation_date= new Date()
		if (experienceInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'experience.label', default: 'Experience'), experienceInstance.id])}"
			//redirect(controller:"MuCV", action:"samplePage")
			render(template:'MuExperience')
		}
		else {
			redirect(controller:"MuExperience", action: "index", id: experienceInstance.id)
		/*	render(view: "createMuExperience", model: [experienceInstance: experienceInstance])*/
		}
	}

	def MuExperienceList ={
		def experiences = MuExperience.all()
		if (!experiences) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'experience.label', default: 'Experience'), params.id])}"
			redirect(action: "list")
		}
		else {
			[experiences: experiences]
		}
	}

	def update ={
		def experienceInstance = MuExperience.get(params.id)
		if (!experienceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'experience.label', default: 'Experience'), params.id])}"
			redirect(action: "list")
		}
		else {
			[experienceInstance: experienceInstance]
		}
	}

	def createMuExperience = {
		def experienceInstance = new MuExperience()
		experienceInstance.properties = params
		return [experienceInstance: experienceInstance]
	}

	def cancel = {
		def criteriaGroupInstance = CriteriaGroup.get(params.id)
		//redirect(controller:"evaluation", action:"edit", id:criteriaGroupInstance.evaluation.id)
	}
}
