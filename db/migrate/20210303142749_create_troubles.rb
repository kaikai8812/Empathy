class CreateTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :troubles do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :content
      t.boolean :is_solved, default: false

      t.timestamps
    end
  end
end
