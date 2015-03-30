package melibook

class MessageTagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "Messages"

    def messages = { attrs ->
    	def messages = attrs.conversation.messages.sort{it.timestamp}
    	out << render(template:"/templates/messageTemplate", model: [messages: messages])
    }
}
