class AddDescriptionToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :description, :text
  end
end
