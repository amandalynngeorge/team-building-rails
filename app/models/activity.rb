class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, length: {1..50}
  validates :description, presence: true
  validates :categories, length: {:minimum => 1}
end
