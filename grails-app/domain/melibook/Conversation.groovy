package melibook

class Conversation {

    //User sender
	//User reciver

	static hasMany = [messages: Message, users: User]
	static belongsTo = User
	
    static constraints = {
    }
}
