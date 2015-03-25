package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class PostController {
	def postService

    def index() { 
    	return [posts: Post.list()]
    }

    def newPost(){
    	println params.content
    	postService.create(params.content);
    	redirect controller: 'index', action: 'index'
    }
}
