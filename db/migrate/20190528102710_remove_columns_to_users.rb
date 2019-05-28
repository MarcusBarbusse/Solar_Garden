class RemoveColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :adress
    remove_column :users, :name
    remove_column :users, :city
    remove_column :users, :postal_code
    remove_column :users, :country
    remove_column :users, :garden_owner
  end
end
