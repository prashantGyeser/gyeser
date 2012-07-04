class Restaurant < ActiveRecord::Base
  attr_accessible :address, :detailsImageURL, :imageURL, :name, :tags, :deliveryTime
	validates :name, :address, :tags, :deliveryTime, :presence => true
	validates :name, :uniqueness => true
  has_many :menu_items
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
