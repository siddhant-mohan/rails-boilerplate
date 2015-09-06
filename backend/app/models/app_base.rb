class AppBaseModel < ActiveRecord::Base
	self.abstract_class = true
	validates :code, :presence => true, :uniqueness => true
end
