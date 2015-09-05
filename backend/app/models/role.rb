class Role < AppBaseModel
	has_and_belongs_to_many :users, -> { uniq }
	validates :name, :presence => true, :uniqueness => true
end
