package melibook

import java.util.*

class Post {
	Date timestamp
	String content

	static belongsTo = [user: User]
	static hasMany = [likes: Like]

    static constraints = {
    	timestamp nullable: false
    	content nullable: false
    }
}
