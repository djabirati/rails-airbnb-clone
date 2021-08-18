class ChangeAddressType < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :address, :string
    change_column :meals, :address, :string
  end
end
