class CreateOrderStatusesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :orders, :order_statuses, column_options: { foreign_key: true }, table_name: 'order_status_histories' do |t|
      t.index [:order_id, :order_status_id]

      t.timestamps
    end
  end
end
