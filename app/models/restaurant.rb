class Restaurant < ActiveRecord::Base
  attr_accessible :address, :detailsImageURL, :imageURL, :name, :tags, :deliveryTime
  has_many :menu_items
end
