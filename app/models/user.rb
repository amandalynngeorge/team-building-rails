class User < ApplicationRecord
  has_secure_password

  has_many :activities
  has_many :categories, through: :activities

  validates :username, uniqueness: {message: "This username is taken"}
  validates :username, length: {minimum: 6}
  validates :email, uniqueness: {message: "This email is taken"}
  validates :email, presence: true

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash["info"]["email"]
    if user = User.find_by(email: oauth_email)
      return user
    else
      user = User.create(email: oauth_email, password: SecureRandom.hex)
    end
  end
end
