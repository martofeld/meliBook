package melibook

import grails.transaction.Transactional

@Transactional
class UserService {

    def create(user){
        //+ logica
        user.save()
    }

    def delete(user){
        user.delete()
    }

    def findAll(){
    	User.list()
    }

    def findById(id){
    	User.findById(id)
    }

    def findAllByArea(area){
        User.findAllByArea(area)
    }
}