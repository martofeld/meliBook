package melibook

import java.util.Date

class Post {
	Date timestamp
	String content
	int likes

	static belongsTo = [user: User]

    static constraints = {
    	timestamp nullable: false
    	content nullable: false
    	likes nullable: false
    }
}
