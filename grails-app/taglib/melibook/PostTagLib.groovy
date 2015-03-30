package melibook

class PostTagLib {
    //static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "Post"

    def post = { attrs ->
    	out << render(template:"/templates/postTemplate", model: [posts: attrs.posts])
    }

    def comments = {attrs -> 
    	def comments = attrs.comments.sort{it.timestamp}
    	out << render(template:"/templates/commentTemplate", model: [comments: comments])
    }
}
