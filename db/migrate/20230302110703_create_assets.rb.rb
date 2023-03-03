class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :item_name
      t.string :category
      t.string :date_of_purchase
      t.string :warranty
      t.string :brand
      t.string :price
      t.text :comment
      t.string :image
      t.integer :category_id
      t.integer :member_id 
    end
  end
end
