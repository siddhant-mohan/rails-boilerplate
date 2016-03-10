class Permission < AppBaseModel
	has_and_belongs_to_many :roles, -> { uniq }
	validates_presence_of :action, :subject
	validates_uniqueness_of :action, :scope => [:subject]
end
