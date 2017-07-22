class User < ApplicationRecord
  has_secure_password

  has_many :activities
  has_many :categories, through: :activities

  validates :username, uniqueness: {message: "This username is taken"}
  validates :email, uniqueness: {message: "This email is taken"}

end
