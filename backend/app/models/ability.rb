class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new # guest user (not logged in)
		if user.super_admin?
			can :manage, :all
		end

		user.permissions.each do |p|
			klass = p.subject.constantize rescue p.subject.to_sym
			can p.action.to_sym, klass
		end

		allowances(user)
		denials(user)
	end

	private
	def allowances(user)
	# 	the hash conditions will come here
	end
	def denials(user)
	# 	hardcoded cannot type permissions come here
	end
end
