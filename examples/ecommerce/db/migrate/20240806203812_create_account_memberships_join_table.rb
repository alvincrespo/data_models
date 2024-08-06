class CreateAccountMembershipsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :accounts, :users, column_options: { foreign_key: true }, table_name: "account_memberships" do |t|
      t.references :role, null: false, foreign_key: true

      t.index [:account_id, :user_id]

      t.timestamps
    end
  end
end
