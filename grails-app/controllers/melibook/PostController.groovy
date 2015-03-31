package melibook

import grails.plugin.springsecurity.annotation.*
import grails.converters.JSON

@Secured(["ROLE_USER"])
class PostController {
    def postService
    def springSecurityService

    def view(int id){
        def post = Post.get(id)
        def likers = post.likes.collect{it.liker}
        def commenters = post.comments.collect{it.commenter}

        return [post: post, likers: likers, commenters: commenters]
    }

    def newPost(){
        if(params.area) //params.area is a boolean that tells if the post is from an area or not
           postService.create(params.content, true);
        else
           postService.create(params.content, false);
        redirect controller: 'index', action: 'index'
    }

    def addLike(int id){
        def response = postService.addLike(id);
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

        def postsAdapted = Area.getSortedPosts("all")

        def areaPostsAdapted = Area.getSortedPosts(area.name)

        def taglib = new PostTagLib()

        if(params.area){
            render taglib.post(posts: areaPostsAdapted)
            return
        }else{
            render taglib.post(posts: postsAdapted)
            return
        }
    }

    def refreshComments(){
        def post = Post.get(params.id as int)

        def commentsAdapted = post.comments.sort { 
            it.timestamp
        }
    
        def taglib = new PostTagLib()

        render taglib.comments(comments: commentsAdapted)
    }
}
