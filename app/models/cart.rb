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

	def add_menu_item(menu_item_id,quantity)
		current_item = line_items.find_by_menu_item_id(menu_item_id)
		logger.debug "Ok it is getting to the function"
		logger.debug "Menu Item quantity in the cart model: #{quantity}"
		if current_item
			logger.debug "Ok it is in the if function in the cart model"
			current_item.quantity += 1
		else
			logger.debug "Ok it is in the else function in the cart model"
			logger.debug "In the else function in the cart model the quantity is:#{quantity}"
			current_item = line_items.build(menu_item_id: menu_item_id)
			current_item.quantity = quantity
			logger.debug "The line item id in the cart model is:#{current_item.id} "
			logger.debug "The line item quantity in the cart model is:#{current_item.quantity} "
		end
		current_item
	end
end
