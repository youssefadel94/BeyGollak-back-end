class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :reciever_id
      t.string :post_content
      t.timestamps null: false
    end
  end
end
