class AddIsCheffToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_cheff, :boolean, default: false
  end
end
