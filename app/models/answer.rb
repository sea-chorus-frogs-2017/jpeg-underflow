class Answer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_text, null: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
