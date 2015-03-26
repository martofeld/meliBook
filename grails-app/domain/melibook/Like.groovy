package melibook

class Like {
	static belongsTo = [post: Post, liker: User]

    static constraints = {
    }
    static mapping = {
    	table "megusta"
    }
}
