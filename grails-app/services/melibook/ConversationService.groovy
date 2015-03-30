package melibook

import grails.transaction.Transactional
import java.text.SimpleDateFormat

@Transactional
class ConversationService {
	def springSecurityService

    def serviceMethod() {

    }

    def createConversation(to, content){
    	def sender = springSecurityService.currentUser.user
    	def receiver = SpringUser.findByUsername(to).user

        def user1 = User.get(sender.id)
        def user2 = User.get(receiver.id)

        def query = "SELECT c FROM Conversation c WHERE :user1 in (SELECT u FROM Conversation c1 JOIN c1.users u WHERE c1.id = c.id) AND :user2 in (SELECT u FROM Conversation c2 JOIN c2.users u WHERE c2.id = c.id)"
        def result = Conversation.executeQuery(query, [user1: user1, user2: user2])

        def message = new Message(timestamp: (new Date()).toTimestamp(), message: content, sender: sender)
        
        def conversation

        if(!result){
            conversation = new Conversation(lastUpdate: message.timestamp).save()
            conversation.addToUsers(sender)
            conversation.addToUsers(receiver)
        }else{
            conversation = result
        }

        conversation.addToMessages(message)
        //conversation.save()
    }

    def replyConversation(id, content, userId){
    	def sender = User.findById(userId)
    	def message = new Message(timestamp: (new Date()).toTimestamp(), message: content, sender: sender)
    	def conversation = Conversation.findById(id).addToMessages(message)
        conversation.lastUpdate = message.timestamp
    	conversation.save()
    }
}
