class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :answers
  has_many :votes
  belongs_to :user

  validates_presence_of :user
end
