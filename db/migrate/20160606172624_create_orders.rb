class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total, default: 0, null: false
      t.references :ordered_by, polymorphic: true
      t.integer :status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
