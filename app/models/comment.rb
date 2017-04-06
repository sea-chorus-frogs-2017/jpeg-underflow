class Comment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_text, null: false
      t.integer :user_id, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null:false

      t.timestamps null: false
    end
  end

  add index :comments, [commentable_type, :commentable_id]
end
