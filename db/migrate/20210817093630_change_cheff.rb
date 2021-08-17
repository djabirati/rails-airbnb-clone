class ChangeCheff < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_cheff, :boolean, :default => false
  end
end
