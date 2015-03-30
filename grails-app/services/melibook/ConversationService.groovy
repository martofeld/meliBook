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
        //def c = Conversation.findByUsers(sender, receiver)?:new Conversation()
        //no encuentra el atributo users en la clase conversations entonces crea dos conversaciones, queremos hacer que
        //si ya existe la conv no cree una nueva. Como hacemos con el criteria builder?
        println Conversation.withCriteria {
            
                for(user in Conversation.users) {
                    eq("user", receiver)
                }

        }
        /*println Conversation.withCriteria{
            users{
                eq()
            }
            /*and {
                users{
                    'in'(receiver)
                }   
        }
            }*/


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
