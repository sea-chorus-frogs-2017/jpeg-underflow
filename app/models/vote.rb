class Vote < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :answer_id, null: false
      t.string :up_or_down, null: false

      t.timestamp null: false
    end
  end
end
