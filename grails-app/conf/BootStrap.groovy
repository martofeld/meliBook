import melibook.*

class BootStrap {

    def init = { servletContext ->
        Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(flush: true)
        new Area(name: "IT").save(flush: true)
        new Area(name: "RRHH").save(flush: true)
        new Area(name: "Mercado Pago").save(flush: true)
        new Area(name: "all").save(flush: true)
    }
    def destroy = {
    }
}
