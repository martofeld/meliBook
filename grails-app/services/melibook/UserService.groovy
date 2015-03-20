package melibook

import grails.transaction.Transactional

@Transactional
class UserService {

    def create(def userCmd){
        //+ logica
        println "service"
        def all = new Role(authority: "ROLE_ALL").save()

        def user = userCmd.getUser()
        if(!user.save())
            return false    
        def springUser = userCmd.getSpringUser()
        if(!springUser.save())
            return false
        SpringUserRole.create springUser, all, true
        return true
        
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

    def checkName 
}
