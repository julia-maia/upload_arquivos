class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :description
      t.decimal :price
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
