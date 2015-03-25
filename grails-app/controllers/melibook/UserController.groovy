package melibook

import grails.plugin.springsecurity.annotation.*
import melibook.*

@Secured(["permitAll"])
class UserController {
	def userService

    def index() {
        
    }

    @Secured(["permitAll"])
    def login(){
    	redirect controller: 'login', action: 'auth'
    }

	@Secured(["permitAll"])
    def register(UserCommand userCommand){
    	if(request.get){
    		println "asdasdasda"
			return [userCommand: new UserCommand()]
    	}

    	if (userCommand.hasErrors()) {
    		println "errroerorororor"
    		return [userCommand: userCommand]
		}

    	if(userService.create(userCommand)){
    		println "holii"
    		redirect controller: 'login', action: 'auth'
    	}else{
    		println "chauu"
    		return [userCommand: userCommand]
    	}
    }

    def conversations(){
        conversations = Conversation.getByUser(springSecurityService.currentUser).list()
        [conversations: conversations]
    }
    

    def profile(int id){

    }
}

class UserCommand {
	String password
	String mail
	String name
	String lastName
	Date birth = new Date().clearTime()
	String area

    
    static constraints = {
	    name(blank: false)
	    lastName(blank: false)
	   	birth(nullable: true)
	   	mail(blank: false, minSize: 6)
	   	password(blank: false, minSize: 6)
	   	area(blank: false)
	}

	def getUser(){
		new User(name: name, lastName: lastName, birth: birth)
	}

	def getSpringUser(){
		new SpringUser(username: mail, password: password)
	}


}