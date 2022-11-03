class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, default: ""
      t.integer :item_id, null: false, default: ""
      t.string :comment, null: false, default: ""
      t.string :star, null: false, default: ""

      t.timestamps
    end
  end
end