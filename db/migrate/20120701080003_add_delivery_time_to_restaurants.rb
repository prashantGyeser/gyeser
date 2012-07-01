class AddDeliveryTimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :deliveryTime, :integer
  end
end
