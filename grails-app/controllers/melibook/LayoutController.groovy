package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class LayoutController {
	def springSecurityService

    def main() {
    	[usersSpring: SpringUser.list()]
    }
}
