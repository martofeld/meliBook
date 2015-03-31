package melibook

class UserTagLib {
	static namespace = "User"

	def avatar(){
		out << render(template:"/templates/avatarTemplate", model: [member: attrs.user])
	}

	def conversations(){
		out << render(template:"/templates/conversationTemplate", model: [conversation: attrs.conversation])
	}
}