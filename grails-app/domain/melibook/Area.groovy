package melibook

class Area {

	String name

	static hasMany = [users: User, posts: Post]

    static constraints = {
    	name nullable: false
    }
}