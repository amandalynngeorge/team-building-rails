class Topic < ApplicationRecord
  has_many :activity_topics
  has_many :activities, through: :activity_topics
  validates :name, length: {maximum: 25, message: "Topic name has 25 character maximum"}
end
