package melibook
import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class ConversationController {

	def conversationService
    def index() { }

    def newConversation(){
    	print "holasdfa"
    	println params.to
    	println params.message
    	conversationService.createConversation(params.to, params.message)
    	redirect controller: 'user', action: 'conversations'
    }

    def view(int id){
    	return [conversation: Conversation.findById(id)]
    }
}