package melibook
import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class ConversationController {

	def conversationService
    def springSecurityService

    def index() {

    }

    def newConversation(){
    	println params.to
    	println params.message
    	conversationService.createConversation(params.to, params.message)
    	redirect controller: 'user', action: 'conversations'
    }

    def reply(){
    	conversationService.replyConversation(params.id, params.message, springSecurityService.currentUser.user.id)
    	redirect controller: 'conversation', action: 'view', id: params.id
    }

    def view(int id){
    	[conversation: Conversation.findById(id), user: springSecurityService.currentUser.user]
    }

    def refreshMessages(){
        def conversation = Conversation.get(params.id as int)
    
        def taglib = new MessageTagLib()

        render taglib.messages(conversation: conversation, user: springSecurityService.currentUser.user)
    }
}