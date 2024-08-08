class CreateProductPriceHistory < ActiveRecord::Migration[7.1]
  def change
    create_table :product_price_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.boolean :active, default: false, null: false

      t.index [:product_id, :active]

      t.timestamps
    end
  end
end
