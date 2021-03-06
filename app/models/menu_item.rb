# == Schema Information
#
# Table name: menu_items
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  price         :decimal(, )
#  category      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#

class MenuItem < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price, :restaurant_id
  belongs_to :restaurant
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	private
		# Ensure that there are no line items referencing this menu item before it is destroyed
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end
