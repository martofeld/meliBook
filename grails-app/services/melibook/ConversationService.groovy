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
        println Conversation.withCriteria{
            users{
                'in'("id", receiver.id)
                and {
                    'in'("id", sender.id)
                }
            }
            /*and {
                users{
                    'in'(receiver)
                }   
            }*/
        }


        def message = new Message(timestamp: (new Date()).toTimestamp(), message: content, sender: sender)
        
        def conversation = new Conversation(lastUpdate: message.timestamp).save()
        conversation.addToUsers(sender)
        conversation.addToUsers(receiver)
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
