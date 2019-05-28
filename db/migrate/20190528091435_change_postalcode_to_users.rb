class ChangePostalcodeToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :gardens, :postal_code, :string
  end
end
