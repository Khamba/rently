class CreateUserLikes < ActiveRecord::Migration
  def change
    create_table :user_likes do |t|
      t.references :user, index: true, polymorphic: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
