package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class IndexController {
	def springSecurityService

    def index() {
    	def area = springSecurityService.currentUser.user.area
        def lastUsers = getLastUsers();
        def result = [posts: Area.findByName("all").posts.sort { 
            it.timestamp
        }.reverse(),
        areaPosts: Area.findByName(area.name).posts.sort { 
            it.timestamp
        }.reverse(), user: springSecurityService.currentUser.user, username: springSecurityService.currentUser.username,
         users: lastUsers]

    }

    def getLastUsers(){
        def all = User.list();
        def lastThree = []

        for(int i = 0; i < 3 && i < all.size(); i++) {
            def last = all.getAt((-all?.size()+1+i))
            lastThree.add(last)
        }

        return lastThree;
    }
}
