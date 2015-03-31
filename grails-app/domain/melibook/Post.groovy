package melibook

import java.util.*

class Post {
	Date timestamp
	String content

	static belongsTo = [user: User]
	static hasMany = [likes: Like, comments: Comment]

    static constraints = {
    	timestamp nullable: false
    	content nullable: false
    }

    static getSortedPosts(){
    	Post.list().sort { 
    		it.timestamp
    	}.reverse()
    }
}
