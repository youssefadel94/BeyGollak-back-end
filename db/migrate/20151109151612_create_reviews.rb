class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :review_content
      t.integer :street_id
      t.timestamps 
    end
    # validates_presence_of :review_content, message: 'cant submit empty review'
  end
end
