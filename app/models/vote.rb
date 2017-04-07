class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates_presence_of :user
end
