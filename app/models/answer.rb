class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes
  belongs_to :user
  belongs_to :question

  validates_presence_of :user 
  validates_presence_of :question
end
