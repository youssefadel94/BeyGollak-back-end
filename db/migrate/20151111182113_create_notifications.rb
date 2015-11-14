class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :notification_content
      t.timestamps null: false
    end
  end
end
