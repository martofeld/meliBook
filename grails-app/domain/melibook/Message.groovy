package melibook

import java.util.Date

class Message {
	Date timestamp
    User from
	User to
	String message
	boolean read
    
    static constraints = {
    	timestamp nullable: false
    	to nullable: false
    	from nullable: false
    	message nullable: false
    }
}