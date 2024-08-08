class CreateOrderStatus < ActiveRecord::Migration[7.1]
  def change
    create_table :order_statuses do |t|
      t.integer :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
