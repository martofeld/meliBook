package melibook

import java.util.Date

class Message {

	Date timestamp
	String message
	boolean read
    User sender

    static belongsTo = [conversation: Conversation]
    
    static constraints = {
    	timestamp nullable: false
    	to nullable: false
    	from nullable: false
    	message nullable: false
    }
}