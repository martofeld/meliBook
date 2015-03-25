package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class IndexController {

    def index() {
    	return [posts: Post.list().sort { 
    		it.timestamp
    	}.reverse()]
    }
}
