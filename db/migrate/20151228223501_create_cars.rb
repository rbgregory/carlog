class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :state
      t.string :plate
      t.string :vin
      t.string :slug
      t.text   :notes
      t.timestamps
    end
  end
end
