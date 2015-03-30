package melibook

import grails.plugin.springsecurity.annotation.*
import grails.converters.JSON

@Secured(["ROLE_USER"])
class PostController {
	def postService
    def springSecurityService

    def index() { 
    	return [posts: Post.list()]
    }

    def view(int id){
        println id
        def post = Post.get(id)
        def likers = post.likes.collect{it.liker}
        def commenters = post.comments.collect{it.commenter}

        println post
        println likers
        return [post: post, likers: likers, commenters: commenters]
    }

    def newPost(){
        println params

        if(params.area) //params.area is a boolean that tells if the post is from an area or not
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

    def addComment(){
        def result = postService.addComment(params.comment, params.id)
        if(result == false)
            render "error"
        else
            render result
    }

    def refreshPosts() {
        def area = springSecurityService.currentUser.user.area

        def postsAdapted = Area.findByName("all").posts.sort { 
            it.timestamp   
        }.reverse().collect {
            [content: it.content, author: it.user.name, likes: it.likes.size(), id: it.id]
        }

        def areaPostsAdapted = Area.findByName(area.name).posts.sort { 
            it.timestamp   
        }.reverse().collect {
            [content: it.content, author: it.user.name, likes: it.likes.size(), id: it.id]
        }

        def result = [posts: postsAdapted, areaPosts: areaPostsAdapted]

        render result as JSON
    }

    def refreshComments(){
        def post = Post.get(params.id as int)

        def commentsAdapted = post.comments.sort { 
            it.timestamp
        }.collect {
            [commenter: it.commenter.name + " " + it.commenter.lastName, comment: it.comment]
        }

        render commentsAdapted as JSON
    }
}
