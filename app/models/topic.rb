class Topic < ApplicationRecord
  has_and_belongs_to_many :activities
  validates :name, length: {maximum: 25, message: "Topic name has 25 character maximum"}
end
