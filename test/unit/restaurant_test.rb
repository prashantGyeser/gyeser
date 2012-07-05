# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :string(255)
#  tags            :string(255)
#  imageURL        :string(255)
#  detailsImageURL :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deliveryTime    :integer
#  longitude       :float
#  latitude        :float
#

require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
