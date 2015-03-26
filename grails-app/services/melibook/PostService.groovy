package melibook

import grails.transaction.Transactional

//Cuando estas en una transaccion por default se hace un flush al final
@Transactional
class PostService {
    def springSecurityService

    def create(def content){
        println content
        Post post = new Post(content: content,
                            timestamp: (new Date()).toTimestamp())
        springSecurityService.currentUser.user.addToPosts(post)
        post.save()
    }

    def delete(def post){
    	//User.findById(post.user.id).posts.findByPost(post).delete(flush: true)
    	//post.delete(flush:true)
        Post.get(post.id).delete()
    }

    def addLike(def id){
        def post = Post.findById(id);
        
        if(!post.likers.findById(springSecurityService.currentUser.user.id))
            post.likers.add(springSecurityService.currentUser.user);
        else
            return removeLike(post)

        if(!post.save())
            return false
        else
            return post.likers.size()
    }

    def removeLike(post){
        post.likers.remove(springSecurityService.currentUser.user)

        if (!post.save())
            return false
        else
            return post.likers.size()
    }

    def findByUserAndArea(def user){
    	Post.findByUserAndArea(user, user.area)
    }

    def findByUser(def user){
    	Post.findByUser(user)
    }

    def findByArea(def area){
    	Post.findByArea(area)
    }

    def findAll(){
    	Post.list()
    }
}