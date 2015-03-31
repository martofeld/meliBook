package melibook

import grails.plugin.springsecurity.annotation.*
import melibook.*

@Secured(["ROLE_USER"])
class SearchController {

    def index() { }

    def search(){
        def users = []
        users << User.findAllByNameLike("%${params.query}%")
        users << User.findAllByLastNameLike("%${params.query}%")
        users << SpringUser.findAllByUsernameLike("%${params.query}%").user

        users = users.flatten().unique()

        def springUsers = users.collect{
            SpringUser.findByUser(it)
        }

    	return [springUsers: springUsers]
    }
}