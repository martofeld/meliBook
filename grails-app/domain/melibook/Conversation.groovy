package melibook

class Conversation {

    //User sender
	//User reciver
	Date lastUpdate

	static hasMany = [messages: Message, users: User]
	static belongsTo = User
	
    static constraints = {
    }
}
