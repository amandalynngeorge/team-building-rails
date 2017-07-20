class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :topics

  validates :title, length: {in: 1..50}
  validates :description, presence: true
end
