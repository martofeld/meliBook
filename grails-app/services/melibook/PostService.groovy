package melibook

import grails.transaction.Transactional

//Cuando estas en una transaccion por default se hace un flush al final
@Transactional
class PostService {

    def create(def post){
        post.save()
    }

    def delete(def post){
    	//User.findById(post.user.id).posts.findByPost(post).delete(flush: true)
    	//post.delete(flush:true)
        Post.get(post.id).delete()
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