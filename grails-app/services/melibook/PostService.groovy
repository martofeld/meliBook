package melibook

import grails.transaction.Transactional

//Cuando estas en una transaccion por default se hace un flush al final
@Transactional
class PostService {
    def springSecurityService

    def create(def content, def area){
        Post post = new Post(content: content,
                            timestamp: (new Date()).toTimestamp())
        springSecurityService.currentUser.user.addToPosts(post)
        
        if(area)
            springSecurityService.currentUser.user.area.addToPosts(post)
        else
            Area.findByName("all").addToPosts(post)
        post.save()
    }

    def addLike(def id){
        def post = Post.get(id)
        println post
        def currentUser = springSecurityService.currentUser.user

        def liker = post.likes.find {
            it.liker.id == currentUser.id
        }
        
        println liker

        if(!liker){
            println "true"
            def like = new Like(liker: currentUser, post: post)
            post.addToLikes(like)
        }
        else{
            println "false"
            post.removeFromLikes(liker)
            liker.delete()
        }

        if(!post.save())
            return false
        else{
            return post.likes.size()
        }
    }

    def addComment(def content, def id){
        def post = Post.get(id)
        def currentUser = springSecurityService.currentUser.user
        def comment = new Comment(commenter: currentUser, post: post, comment: content, timestamp: new Date())

        post.addToComments(comment)
        if(!post.save())
            return false
        else
            return currentUser.name + " " + currentUser.lastName
    }
}