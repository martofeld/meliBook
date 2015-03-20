package melibook

class Conversation {

    User sender
	User reciver

	static hasMany = [messages: Message]

    static constraints = {
    }
}
