package melibook

import java.util.Date

class Message {
	Date timestamp
	User reciver
	User from
	String message
	boolean read

    static constraints = {
    	timestamp nullable: false
    	reciver nullable: false
    	from nullable: false
    	message nullable: false
    }
}