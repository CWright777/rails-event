class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :state
      t.string :location
      
      t.timestamps null: false
    end
  end
end
