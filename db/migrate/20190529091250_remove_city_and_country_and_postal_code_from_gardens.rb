class RemoveCityAndCountryAndPostalCodeFromGardens < ActiveRecord::Migration[5.2]
  def change
    remove_column :gardens, :city, :country, :string 
    remove_column :gardens, :postal_code, :string 
  end
end
