package melibook

class Area {

	String name

	static hasMany = [users: User, posts: Post]

    static constraints = {
    	name nullable: false
    }

    static getSortedPosts(def area){
    	Area.findByName(area).posts.sort { 
            it.timestamp
        }.reverse()
    }
}