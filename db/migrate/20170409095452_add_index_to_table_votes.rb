class AddIndexToTableVotes < ActiveRecord::Migration
  def change
    add_index :votes, [:votable_type, :votable_id]
  end
end
