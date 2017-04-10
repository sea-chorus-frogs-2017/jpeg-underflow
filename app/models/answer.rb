class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes
  belongs_to :user
  belongs_to :question

  validates_presence_of :user
  validates_presence_of :question

  def is_best_answer
    if this.best
      true
    else
      false
    end
  end
end
