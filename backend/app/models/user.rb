require 'app_base' # user model is used early by devise. hence require is needed

class User < AppBaseModel
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

	enum status: [:inactive, :active]
	has_many :user_auths, :dependent => :destroy
	has_and_belongs_to_many :roles, -> { uniq }

	validates :firstname, :lastname, :presence => true
	# validates_presence_of :uid
	# validates :uid, uniqueness: true
	validates_length_of :email, :maximum => 255
	validates_length_of :encrypted_password, :maximum => 255
	validates_length_of :reset_password_token, :maximum => 255
	validates_length_of :current_sign_in_ip, :maximum => 255
	validates_length_of :last_sign_in_ip, :maximum => 255
	validates_length_of :firstname, :maximum => 255
	validates_length_of :lastname, :maximum => 255
	validates_length_of :confirmation_token, :maximum => 255
	validates_length_of :unconfirmed_email, :maximum => 255

	before_validation :strip_whitespaces
	has_one :secret_code
	attr_accessor :code, :codes_available


	def fullname
		"#{firstname} #{lastname}"
	end

	def strip_whitespaces
		self.firstname = self.firstname.strip if !self.firstname.nil?
		self.email = self.email.strip if !self.email.nil?
		self.lastname = self.lastname.strip if !self.lastname.nil?
	end

	def self.super_admin
		self.first
	end

	def super_admin?
		self==User.super_admin
	end

end
