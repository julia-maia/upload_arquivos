class CreatePurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :purchases do |t|
      t.references :purchaser, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
