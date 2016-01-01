class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :car_id
      t.date :date
      t.integer :mileage
      t.string :vendor
      t.decimal :price
      t.string :slug
      t.timestamps
    end
  end
end
