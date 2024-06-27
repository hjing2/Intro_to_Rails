class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.string :school
      t.string :street_name
      t.string :language
      t.integer :year_installed
      t.string :legislation_link
      t.string :location

      t.timestamps
    end
  end
end
