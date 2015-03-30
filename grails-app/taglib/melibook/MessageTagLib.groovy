package melibook

class MessageTagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def message = { attrs ->
    	out << render(template:"/templates/messageTemplate", model: [conversation: attrs.conversation])
    }
}
