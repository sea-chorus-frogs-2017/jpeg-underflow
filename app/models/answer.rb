class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user

  validates_presence_of :user 

end
