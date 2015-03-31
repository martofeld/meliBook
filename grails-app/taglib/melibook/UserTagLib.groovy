package melibook

class UserTagLib {
	static namespace = "User"

	def avatar = { attrs ->
		out << render(template:"/templates/avatarTemplate", model: [member: attrs.user])
	}

	def conversations = { attrs ->
		out << render(template:"/templates/conversationTemplate", model: [conversation: attrs.conversation])
	}
}