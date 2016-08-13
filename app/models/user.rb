class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :rsvps
	has_many :events, through: :rsvps
	has_many :penalties, through: :rsvps

	before_save :fill_username

	private

	def fill_username
		self.username ||= self.email
	end
end
