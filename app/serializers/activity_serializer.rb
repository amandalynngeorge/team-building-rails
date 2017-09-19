class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :goal, :rules, :time
  belongs_to :category, :user
end
