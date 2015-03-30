import melibook.Post

class PostTagLib {
    //static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "Post"

    def post = { attrs ->
    	out << render(template:"/templates/postTemplate", model: [posts: attrs.posts])
    }
}
