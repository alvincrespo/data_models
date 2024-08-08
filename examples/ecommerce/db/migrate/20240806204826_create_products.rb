class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :availability, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.integer :unit

      t.timestamps
    end
  end
end
