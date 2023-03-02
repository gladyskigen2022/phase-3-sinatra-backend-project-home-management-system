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
      t.references :category, foreign_key: true
      t.references :member, foreign_key: true
    end
  end
end
