class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_description
      t.integer :category_id
      t.integer :product_condition_id
      t.integer :shipping_charges_id
      t.integer :prefecture_id 
      t.integer :days_to_ship_id
      t.integer :selling_price
      t.references :user
      t.timestamps
    end
  end
end
