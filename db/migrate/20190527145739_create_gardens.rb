class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :city
      t.integer :postal_code
      t.string :country
      t.integer :square_meters
      t.integer :price
      t.string :photo

      t.timestamps
    end
  end
end
