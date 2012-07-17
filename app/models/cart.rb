# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  total      :integer
#

class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
	has_many :line_items, :dependent => :destroy
	belongs_to :order
end
