class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :user

  validates_presence_of :user

  def has_best_answer
    # later, add code to check to see if this question has a "best" answer selected
    return false
  end
end
