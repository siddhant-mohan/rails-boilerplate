require 'app_base' # user model is used early by devise. hence require is needed

class User < AppBaseModel
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

	enum status: [:inactive, :active]
	has_many :user_auths, :dependent => :destroy
	has_and_belongs_to_many :roles, -> { uniq }
	has_many :permissions, :through => :roles

	validates :firstname, :lastname, :presence => true
	# validates_presence_of :uid
	validates :uid, uniqueness: true
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

	def self.search(params)
		if params[:search_name].present? and params[:search_uid].present?
			arr=params[:search_name].split
			if arr.length == 2
				where('uid ILIKE ? AND (firstname ILIKE ? AND lastname ILIKE ?)', "#{params[:search_uid]}%", "%#{arr[0]}%", "%#{arr[1]}%")
			elsif arr.length == 1
				where('uid ILIKE  ? AND(firstname ILIKE ? OR lastname ILIKE ?)', "#{params[:search_uid]}%", "%#{arr[0]}%", "%#{arr[0]}%")
			end
		elsif params[:search_name].present?
			arr=params[:search_name].split
			if arr.length == 2
				where('firstname ILIKE ? AND lastname ILIKE ?', "%#{arr[0]}%", "%#{arr[1]}%")
			elsif arr.length == 1
				where('firstname ILIKE ? OR lastname ILIKE ?', "%#{arr[0]}%", "%#{arr[0]}%")
			end
		elsif params[:search_uid].present?
			where('uid ILIKE  ?', "%#{params[:search_uid]}%")
		else
			all
		end
	end

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
