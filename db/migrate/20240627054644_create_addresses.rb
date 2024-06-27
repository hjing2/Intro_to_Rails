class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :neighbourhood
      t.string :full_address

      t.timestamps
    end
  end
end
