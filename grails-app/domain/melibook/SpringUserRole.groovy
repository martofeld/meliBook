package melibook

import org.apache.commons.lang.builder.HashCodeBuilder

class SpringUserRole implements Serializable {

	private static final long serialVersionUID = 1

	SpringUser springUser
	Role role

	boolean equals(other) {
		if (!(other instanceof SpringUserRole)) {
			return false
		}

		other.springUser?.id == springUser?.id &&
		other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (springUser) builder.append(springUser.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static SpringUserRole get(long springUserId, long roleId) {
		SpringUserRole.where {
			springUser == SpringUser.load(springUserId) &&
			role == Role.load(roleId)
		}.get()
	}

	static boolean exists(long springUserId, long roleId) {
		SpringUserRole.where {
			springUser == SpringUser.load(springUserId) &&
			role == Role.load(roleId)
		}.count() > 0
	}

	static SpringUserRole create(SpringUser springUser, Role role, boolean flush = false) {
		def instance = new SpringUserRole(springUser: springUser, role: role)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(SpringUser u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = SpringUserRole.where {
			springUser == SpringUser.load(u.id) &&
			role == Role.load(r.id)
		}.deleteAll()

		if (flush) { SpringUserRole.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(SpringUser u, boolean flush = false) {
		if (u == null) return

		SpringUserRole.where {
			springUser == SpringUser.load(u.id)
		}.deleteAll()

		if (flush) { SpringUserRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		SpringUserRole.where {
			role == Role.load(r.id)
		}.deleteAll()

		if (flush) { SpringUserRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, SpringUserRole ur ->
			if (ur.springUser == null) return
			boolean existing = false
			SpringUserRole.withNewSession {
				existing = SpringUserRole.exists(ur.springUser.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['role', 'springUser']
		version false
	}
}
