package melibook

class Area {

	String name

	static hasMany = [users: User]

    static constraints = {
    	name nullable: false
    }
}