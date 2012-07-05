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

require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
