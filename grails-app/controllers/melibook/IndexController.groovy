package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class IndexController {
	def springSecurityService

    def index() {
    	def area = springSecurityService.currentUser.user.area
        def result = [posts: Area.findByName("all").posts.sort { 
            it.timestamp
        }.reverse(),
        areaPosts: Area.findByName(area.name).posts.sort { 
            it.timestamp
        }.reverse(), user: springSecurityService.currentUser.user, users: User.list()[User.list().size()-1..User.list().size()-3]]
    }
}
