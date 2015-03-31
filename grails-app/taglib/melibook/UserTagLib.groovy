package melibook

class UserTagLib {
	static namespace = "User"

	def avatar = { attrs ->
		out << render(template:"/templates/avatarTemplate", model: [member: attrs.user, cssClass: attrs.cssClass])
	}

	def conversation = { attrs ->
		out << render(template:"/templates/conversationTemplate", model: [conversation: attrs.conversation])
	}
}