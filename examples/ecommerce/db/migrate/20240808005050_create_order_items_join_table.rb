class CreateOrderItemsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :orders, :products, column_options: { foreign_key: true }, table_name: "order_items" do |t|
      t.integer :quantity
      t.decimal :price

      t.index [:order_id, :product_id]

      t.timestamps
    end
  end
end
