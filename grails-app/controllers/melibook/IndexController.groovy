package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class IndexController {
	def springSecurityService

    def index() {
    	def area = springSecurityService.currentUser.user.area
    	def c = Post.createCriteria().list() {
		    user {
		    	eq("area", area)
		    }
		}

    	return [posts: Post.list().sort { 
    		it.timestamp
    	}.reverse(),
    	areaPosts: c]
    }
}
