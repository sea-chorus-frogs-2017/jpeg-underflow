class Answer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_text, null: false
      t.integer :personable_id, null: false
      t.integer :questionable_id, null: false

      t.timestamps null: false
    end
  end

  add index :answers, [answer_text, :commentable_id]
  add index :answers, [answer_text, :personable_id]
end
