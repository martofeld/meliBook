package melibook

import grails.plugin.springsecurity.annotation.*

@Secured(["ROLE_USER"])
class IndexController {

    def index() {
    	
    }
}
