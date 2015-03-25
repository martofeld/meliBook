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

    def addLike(int id){
    	def response = postService.addLike(id);
    	println response
    	if(!response){
    		return false
    	}else{
    		render response
    		return
    	}
    }
}
