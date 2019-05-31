class AddColumnToGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :category, :string
  end
end
