package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class IndexController {
	def springSecurityService

    def index() {
    	def c = Post.createCriteria()
		def results = c.list {
		    user{
		    	eq("area": springSecurityService.currentUser.user.area)
		    }
		}

    	return [posts: Post.list().sort { 
    		it.timestamp
    	}.reverse(),
    	areaPosts: results]
    }
}
