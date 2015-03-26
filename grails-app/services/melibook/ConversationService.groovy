package melibook

import grails.transaction.Transactional

@Transactional
class ConversationService {
	def springSecurityService

    def serviceMethod() {

    }

    def createConversation(to, content){

    	def sender = springSecurityService.currentUser.user
    	def receiver = SpringUser.findByUsername(to).user


//        def c = Conversation.createCriteria()
//        def result = c.list {
//            eq("users", sender)
//            eq("users", receiver)
//        }
//        println result


        def conversation = new Conversation().save()
        def message = new Message(timestamp: (new Date()).toTimestamp(), message: content, sender: sender)

        conversation.addToUsers(sender)
        conversation.addToUsers(receiver)
        conversation.addToMessages(message)
        //conversation.save()

        

        


    }
    def replyConversation(id, content){
    	def sender = Conversation.findById(id).users[0]
    	def message = new Message(timestamp: (new Date()).toTimestamp(), message: content, sender: sender)
    	def conversation = Conversation.findById(id).addToMessages(message)
    	conversation.save()

    }


}
