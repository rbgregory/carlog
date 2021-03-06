class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :slug
      t.string :time_zone
      t.timestamps
    end
  end
end
