package melibook

import grails.transaction.Transactional

@Transactional
class ConversationService {
	def springSecurityService

    def serviceMethod() {

    }

    def createConversation(to, content){
    	def sender = springSecurityService.currentUser.user
    	def receiver = User.findByName(to)?:new User(name: to, lastName: '', birth: new Date(), profilePicture:'')
    	def conversation = new Conversation().save()
    	def message = new Message(timestamp: (new Date()).toTimestamp(), message: content, sender: sender)

    	conversation.addToUsers(sender)
    	conversation.addToUsers(receiver)
    	conversation.addToMessages(message)
    	//conversation.save()

    }
}
