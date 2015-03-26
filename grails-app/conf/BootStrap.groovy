import melibook.*

class BootStrap {

    def init = { servletContext ->
        Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(flush: true)
    }
    def destroy = {
    }
}
