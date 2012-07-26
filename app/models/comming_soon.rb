class CommingSoon < ActiveRecord::Base
  attr_accessible :email, :location
  validates :email, :location, :presence => true
end
