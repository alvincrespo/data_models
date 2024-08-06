class CreateSupplierMembershipsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :accounts, :suppliers, column_options: { foreign_key: true }, table_name: "supplier_memberships" do |t|
      t.references :role, null: false, foreign_key: true

      t.index [:account_id, :supplier_id]

      t.timestamps
    end
  end
end
