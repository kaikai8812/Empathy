class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :post_comment_id

      t.timestamps
    end
  end
end
