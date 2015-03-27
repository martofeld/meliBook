package melibook

import grails.transaction.Transactional

//Cuando estas en una transaccion por default se hace un flush al final
@Transactional
class PostService {
    def springSecurityService

    def create(def content, def area){
        println content
        Post post = new Post(content: content,
                            timestamp: (new Date()).toTimestamp())
        springSecurityService.currentUser.user.addToPosts(post)
        Area.findByName(area).addToPosts(post)
        post.save()
    }

    def delete(def post){
    	//User.findById(post.user.id).posts.findByPost(post).delete(flush: true)
    	//post.delete(flush:true)
        Post.get(post.id).delete()
    }

    def addLike(def id){
        def post = Post.findById(id)
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
}