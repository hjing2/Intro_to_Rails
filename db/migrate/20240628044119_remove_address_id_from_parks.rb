class RemoveAddressIdFromParks < ActiveRecord::Migration[7.1]
  def change
    remove_column :parks, :address_id, :integer
  end
end
