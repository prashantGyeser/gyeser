class AddEmailIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :email_id, :string
  end
end
