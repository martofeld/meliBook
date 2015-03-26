package melibook

import java.util.Date

class Post {
	Date timestamp
	String content
	ArrayList<User> likers = new ArrayList<User>();

	static belongsTo = [user: User]

    static constraints = {
    	timestamp nullable: false
    	content nullable: false
    }
}
