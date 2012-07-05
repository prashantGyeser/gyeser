# == Schema Information
#
# Table name: line_items
#
#  id           :integer          not null, primary key
#  menu_item_id :integer
#  cart_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :menu_item_id
	belongs_to :menu_item
	belongs_to :cart
end