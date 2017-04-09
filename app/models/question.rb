class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :user

  validates_presence_of :user
end
