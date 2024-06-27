class AddAttributesToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :street_number, :string
    add_column :addresses, :street_type, :string
    add_column :addresses, :ward, :string
    add_column :addresses, :school_division, :string
    add_column :addresses, :school_division_ward, :string
    add_column :addresses, :latitude, :string
    add_column :addresses, :longitude, :string
    add_column :addresses, :street_address, :string
  end
end
