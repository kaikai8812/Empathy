class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :trouble_id
      t.integer :user_id
      t.text :comment
      t.integer :likes_count
      t.boolean :is_displayed, default: false
      t.boolean :is_thanked, default: false
      t.timestamps
    end
  end
end
