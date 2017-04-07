enable :sessions
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
  validates :name, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, password)
    user = User.find_by(email: email)
    user.password == password
  end
end


