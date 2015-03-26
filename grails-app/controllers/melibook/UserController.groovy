package melibook

import grails.plugin.springsecurity.annotation.*
import melibook.*

@Secured(["permitAll"])
class UserController {
	def userService
    def springSecurityService
    def postService

    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

    def index(String username) {
        println username
        def user = SpringUser.findByUsername(username)?.user
        println user
        [posts: user.posts.sort{it.timestamp}.reverse(), user: user]
    }

    @Secured(["permitAll"])
    def login(){
    	redirect controller: 'login', action: 'auth'
    }

	@Secured(["permitAll"])
    def register(UserCommand userCommand){
    	if(request.get){
			return [userCommand: new UserCommand(), areas: Area.list()]
    	}

    	if (userCommand.hasErrors()) {
    		return [userCommand: userCommand, areas: Area.list()]
		}

    	if(userService.create(userCommand)){
    		redirect controller: 'login', action: 'auth'
    	}else{
    		return [userCommand: userCommand, areas: Area.list()]
    	}
    }

    def conversations(){
        def conversations = springSecurityService.currentUser.user.conversations
        [conversations: conversations, currentUser: springSecurityService.currentUser.user]
    }

    def profile(int id){
        return [posts: springSecurityService.currentUser.user.posts.sort { 
            it.timestamp}.reverse()]
    }

    def select_avatar() {
    }

    def upload_avatar() {
        def user = springSecurityService.currentUser.user // or however you select the current user
        println user
    // Get the avatar file from the multi-part request
        def f = request.getFile('avatar')
        println f.bytes
        // List of OK mime-types
        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Avatar must be one of: ${okcontents}"
            render(view:'select_avatar', model: [user: user])
            return
        }

        // Save the image and mime type
        user.avatar = f.bytes
        user.avatarType = f.contentType
        println user.avatar
        println "File uploaded: $user.avatarType"

        // Validation works, will check if the image is too big
        if (!user.save(flush: true)) {
            println "aa"
            render(view:'select_avatar', model:[user:user])
            return
        }
        println "Avatar (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
        redirect(action:'show')
    }

    def avatar_image() {
        def avatarUser = springSecurityService.currentUser.user
        if (!avatarUser || !avatarUser.avatar || !avatarUser.avatarType) {
            response.sendError(404)
            return
        }
        response.contentType = avatarUser.avatarType
        response.contentLength = avatarUser.avatar.size()
        OutputStream out = response.outputStream
        out.write(avatarUser.avatar)
        out.close()
    }


    def show() {
        [user: springSecurityService.currentUser.user]
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