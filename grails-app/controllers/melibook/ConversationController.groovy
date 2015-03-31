package melibook
import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class ConversationController {

	def conversationService
    def springSecurityService

    def index() {

    }

    def newConversation(){
    	conversationService.createConversation(params.to, params.message)
    	redirect controller: 'user', action: 'conversations'
    }

    def reply(){
        def showed = conversationService.replyConversation(params.id, params.message, springSecurityService.currentUser.user.id)
        def conversations = Conversation.list()
        def user = springSecurityService.currentUser
        redirect(controller: 'user', action: 'conversations', model: [conversations: conversations, currentUser: user, conversationToShow: showed])
    }

    def view(int id){
    	[conversation: Conversation.findById(id), user: springSecurityService.currentUser.user.id]
    }

    def refreshMessages(){
        def conversation = Conversation.get(params.id as int)
    
        def taglib = new MessageTagLib()
    
        render taglib.messages(conversation: conversation, user: springSecurityService.currentUser.user)
    }
}