class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'index')
        "/$user" (controller: 'user', action: 'wall')
        "500"(view:'/error')
	}
}
