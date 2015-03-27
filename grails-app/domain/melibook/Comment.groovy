package melibook

class Comment {

	String comment
	Date timestamp

	static belongsTo = [post: Post, commenter: User]

    static constraints = {
    }
}
