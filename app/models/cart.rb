# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
	has_many :line_items, :dependent => :destroy

	def add_menu_item(menu_item_id)
		current_item = line_items.find_by_menu_item_id(menu_item_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(:menu_item_id => menu_item_id)
		end
		current_item
	end
end
