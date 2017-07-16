class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, length: {in: 1..50}
  validates :description, presence: true
end
