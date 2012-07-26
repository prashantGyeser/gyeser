class CreateCommingSoons < ActiveRecord::Migration
  def change
    create_table :comming_soons do |t|
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
