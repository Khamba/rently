class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
