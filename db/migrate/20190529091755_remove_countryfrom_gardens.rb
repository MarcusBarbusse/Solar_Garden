class RemoveCountryfromGardens < ActiveRecord::Migration[5.2]
  def change
    remove_column :gardens, :country, :string
  end
end
