module CustomHelpers
	def assign_permission(action, subject_name)
		perm = Permission.where(:action=>action, :subject => subject_name).first_or_create!
		role = Role.where(:name => Faker::Lorem.word).first_or_create!
		role.permissions << perm
		role.users << subject.current_user
		subject.current_user.reload
	end
	def revoke_permission(action, subject_name)
		perm = Permission.where(:action=>action, :subject => subject_name).first_or_create!
		subject.current_user.roles.destroy perm.roles
		subject.current_user.reload
	end
	def assign_role(role_name)
		role = Role.where(:name => role_name).first_or_create!
		role.users << subject.current_user
		subject.current_user.reload
	end
	def revoke_role(role_name)
		role = Role.where(:name => role_name).first_or_create!
		subject.current_user.roles.destroy role
		subject.current_user.reload
	end
end

