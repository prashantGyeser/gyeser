class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :tags
      t.string :imageURL
      t.string :detailsImageURL

      t.timestamps
    end
  end
end
