class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :self_comments, as: :commentable, class_name: "Comment"
  has_many :votes

  validates_presence_of :user
end
