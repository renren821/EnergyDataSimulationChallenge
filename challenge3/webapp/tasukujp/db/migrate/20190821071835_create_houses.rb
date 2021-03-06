class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :city, null: false
      t.integer :num_of_people, null: false, default: 0
      t.boolean :has_child, null: false, default: false

      t.timestamps
    end
  end
end
