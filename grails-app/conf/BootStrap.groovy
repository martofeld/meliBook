import melibook.*

class BootStrap {

    def init = { servletContext ->
        def all = new Role(authority: "ROLE_USER").save(flush: true)
        def area = new Area(name: 'all').save(flush: true)
    }
    def destroy = {
    }
}
