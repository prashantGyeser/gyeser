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

require 'spec_helper'

describe LineItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
