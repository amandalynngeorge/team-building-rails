class Topic < ApplicationRecord
  has_and_belongs_to_many :activities

  validates :name, length: {minimum: 25}
end
