package melibook

import grails.plugin.springsecurity.annotation.*
import melibook.*

@Secured(["ROLE_USER"])
class SearchController {

    def index() { }

    def search(){
    	def users = User.findAllByNameLike("%" + params.query + "%")
    	def springUsers = []
    	if (users == null)
    		return [springUsers: springUsers]

    	users.each{ user ->
    		springUsers.add(SpringUser.findByUser(user))
    	}
    	[springUsers: springUsers]
    	

    }
}