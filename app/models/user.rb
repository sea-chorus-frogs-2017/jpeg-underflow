require 'bcrypt'

class User < ActiveRecord::Base
  
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates :email, presence: true, uniqueness: true

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
