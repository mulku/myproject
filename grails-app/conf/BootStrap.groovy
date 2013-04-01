import org.grails.ApkCv.auth.*


class BootStrap {

    def init = { servletContext ->
		if (!User.count()) {
			createData()
		}
    }
    def destroy = {
    }
	
	private void createData() {
		def userRole = new Authority(authority: 'ROLE_USER').save()

		String password = 'password'
		[jeff: 'Jeff Brown', graeme: 'Graeme Rocher', burt: 'Burt Beckwith', peter: 'Peter Ledbrook'].each { userName, realName ->
			def user = new User(username: userName, realName: realName, password: password, enabled: true).save()
			UserAuthority.create user, userRole, true
		}
	}
}
