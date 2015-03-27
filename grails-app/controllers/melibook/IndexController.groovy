package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class IndexController {
	def springSecurityService

    def index() {
    	def area = springSecurityService.currentUser.user.area
    	/*def areaPosts = Post.createCriteria().list() {
		    user {
		    	eq("area", area)
		    }
		}*/

    	return [posts: Area.findByName("all").posts.sort { 
    		it.timestamp
    	}.reverse(),
    	areaPosts: Area.findByName(area.name).posts.sort { 
            it.timestamp   
        }.reverse(),
        area: area.name]
    }
}
