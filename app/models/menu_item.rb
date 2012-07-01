class MenuItem < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price, :restaurant_id
  belongs_to :restaurant
end
