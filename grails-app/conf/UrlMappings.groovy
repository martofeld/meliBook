class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'index')
        "/$username" (controller: 'user', action: 'index')
        "/register" (controller: 'user', action: 'register')
        "/login" (controller: 'login', action: 'auth')
        "/conversations" (controller: 'conversation', action: 'view')
        "500"(view:'/error')
	}
}
