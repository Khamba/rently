class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end
