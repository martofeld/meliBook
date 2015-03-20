package melibook

import java.util.Date

class User {
	String name
	String lastName
	String profilePicture
	Date birth
	
	static belongsTo = [area: Area]
	static hasMany = [posts: Post, conversations: Conversation]

    static constraints = {
    	name nullable: false
    	lastName nullable: false
    	birth nullable: false
    	profilePicture nullable: true
    }
}
