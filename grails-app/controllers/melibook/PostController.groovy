package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class PostController {

    def index() { 
    	return [posts: Post.list().sort {
    		it.timestamp
    	}]
    }
}
