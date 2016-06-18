class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :quantity, default: 1, null: false
      t.string :size, null: false
      t.references :order, index: true, foreign_key: true
      t.integer :price, null: false

      t.timestamps null: false
    end
  end
end
