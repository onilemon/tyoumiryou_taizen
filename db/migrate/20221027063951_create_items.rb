class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false, default: 0
      t.string :name, null: false, default: ""
      t.text :introduction
      t.integer :price, null: false, default: 0


      t.timestamps
    end
  end
end
