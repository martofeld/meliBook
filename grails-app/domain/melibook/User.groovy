package melibook

import java.util.Date

class User {
	String name
	String lastName
	String profilePicture
	byte[] avatar
  	String avatarType
	
	static belongsTo = [area: Area]
	static hasMany = [posts: Post, conversations: Conversation]

    static constraints = {
    	name nullable: false
    	lastName nullable: false
    	profilePicture nullable: true
    	avatar(nullable:true, maxSize: 200000 /* 16K */)
    	avatarType(nullable:true)
    }
}
