class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'index')
        "/$username" (controller: 'user', action: 'index')
        "500"(view:'/error')
	}
}
