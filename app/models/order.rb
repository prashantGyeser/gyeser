# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#

class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :cart_id
	has_one  :cart
end
