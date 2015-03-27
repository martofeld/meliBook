package melibook

import grails.transaction.Transactional

@Transactional
class UserService {

    def create(userCommand){
        //+ logica
        println "service"

        def user = userCommand.getUser()
        println user
        def area = Area.findByName(userCommand.area)
        println area
        if(area == null){
            return false 
        }
        area.addToUsers(user)

        if(!user.save()) {
            user.errors.each { println "${it}" }    
            return false;
        }

        def springUser = userCommand.getSpringUser()
        println springUser
        springUser.user = user
        
        if(!springUser.save()) {
            springUser.errors.each { println "${it}"}    
            return false;
        }

        SpringUserRole.create springUser, Role.findByAuthority("ROLE_USER"), true
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

}