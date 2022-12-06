class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, default: 0
      t.integer :item_id, null: false, default: 0
      t.string :comment, null: false, default: ""
      t.integer :star, null: false, default: 0

      t.timestamps
    end
  end
end
