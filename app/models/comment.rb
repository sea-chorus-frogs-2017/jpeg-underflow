class Comment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_text, null: false
      t.integer :personable_id, null: false
      t.integer :questionable_id, null: false

      t.timestamps null: false
    end
  end

  add index :comments, [comment_text, :commentable_id]
  add index :comments, [comment_text, :personable_id]
end
