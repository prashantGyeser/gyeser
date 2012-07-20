class User < ActiveRecord::Base
  attr_accessible :hashed_password, :name, :salt

  validates :name, :presence => true

	validates :password, :confirmation => true

	attr_accessor :password_confirmation
	attr_reader :password

	validate :password_must_be_present

	private

	def password_must_be_present
		errors.add(:password, "Missing password") unless hashed_password.present?
	end

end
