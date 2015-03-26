import melibook.*

class BootStrap {

    def init = { servletContext ->
        Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(flush: true)
        new Area(name: "it").save(flush: true)
    }
    def destroy = {
    }
}
