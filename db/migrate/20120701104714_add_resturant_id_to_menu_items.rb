class AddResturantIdToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :restaurant_id, :integer
  end
end
