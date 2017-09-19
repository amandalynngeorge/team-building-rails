class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :goal, :rules, :time
  belongs_to :category
  belongs_to :user
  has_many :topics
end
