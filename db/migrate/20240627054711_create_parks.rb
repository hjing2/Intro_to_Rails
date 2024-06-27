class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :park_name
      t.string :address
      t.string :location_description
      t.string :neighbourhood
      t.string :location

      t.timestamps
    end
  end
end
