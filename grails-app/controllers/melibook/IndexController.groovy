package melibook

import grails.plugin.springsecurity.annotation.*
import grails.converters.JSON

@Secured(["ROLE_USER"])
class IndexController {
	def springSecurityService

    def index() {
    	def area = springSecurityService.currentUser.user.area

        def result = [posts: Area.findByName("all").posts.sort { 
            it.timestamp
        }.reverse(),
        areaPosts: Area.findByName(area.name).posts.sort { 
            it.timestamp   
        }.reverse()]

        return result
    }

    def refresh() {
        def area = springSecurityService.currentUser.user.area

        def postsAdapted = Area.findByName("all").posts.sort { 
            it.timestamp   
        }.reverse().collect {
            [content: it.content, author: it.user.name, likes: it.likes.size(), id: it.id]
        }

        def areaPostsAdapted = Area.findByName(area.name).posts.sort { 
            it.timestamp   
        }.reverse().collect {
            [content: it.content, author: it.user.name, likes: it.likes.size(), id: it.id]
        }

        def result = [posts: postsAdapted, areaPosts: areaPostsAdapted]

        render result as JSON
    }
}
