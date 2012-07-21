# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :string(255)
#  tags            :string(255)
#  imageURL        :string(255)
#  detailsImageURL :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deliveryTime    :integer
#  longitude       :float
#  latitude        :float
#  phone_number    :string(255)
#  email_id        :string(255)
#

class Restaurant < ActiveRecord::Base
  attr_accessible :address, :detailsImageURL, :imageURL, :name, :tags, :deliveryTime, :email_id, :phone_number
	validates :name, :address, :deliveryTime, :email_id, :phone_number, :presence => true
	validates :name, :uniqueness => true
  has_many :menu_items
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
