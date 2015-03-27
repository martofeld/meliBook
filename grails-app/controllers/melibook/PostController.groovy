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
        println params
        if(params.area)
    	   postService.create(params.content, true);
        else
           postService.create(params.content, false);
    	redirect controller: 'index', action: 'index'
    }

    def addLike(int id){
    	def response = postService.addLike(id);
    	println response
    	if(response == false){
            render "error"
    		return false
    	}else{
    		render response
    		return
    	}
    }
}
