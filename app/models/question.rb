class Question < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text, null: false
      t.integer :personable_id, null: false
      t.integer :questionable_id, null: false

      t.timestamps null: false
    end
  end

  add index :questions, [question_text, :commentable_id]
  add index :questions, [question_text, :personable_id]
end
