package melibook
import grails.plugin.springsecurity.annotation.*

class UserController {
	def userService


    def index() {

    }

    def login(){
    	redirect controller: 'login', action: 'auth'
    }

	@Secured(["permitAll"])
    def register(UserCommand userCommand){
    	if(request.method == "GET"){
			return [user: new UserCommand()]
    	}

    	if (userCommand.hasErrors()) {
    		return [user: userCommand]
		}

    	if(userService.create(userCommand)){
    		println "holii"
    		redirect controller: 'login', action: 'auth'
    	}
    }

    def profile(int id){

    }
}

class UserCommand {
	String password
	String mail
	String name
	String lastName
	String birth

    
    static constraints = {
	    name(blank: false, minSize: 6)
	    lastName(blank: false, minSize: 6)
	   	birth(blank: false, minSize: 6)
	}

	def getUser(){
		new User(name: name, lastName: lastName, birth: birth)
	}

	def getSpringUser(){
		new SpringUser(username: mail, password: password)
	}


}