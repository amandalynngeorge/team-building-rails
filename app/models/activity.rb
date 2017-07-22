class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :topics

  accepts_nested_attributes_for :topics, reject_if: proc {|attributes| attributes['name'].blank?}

  validates :title, length: {in: 1..50, message: "needs at title"}
  validates :description, presence: {message: "needs a description"}
  validates_associated :topics, {message: "needs a topic"}
end
