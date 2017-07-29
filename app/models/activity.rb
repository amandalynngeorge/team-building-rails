class Activity < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :activity_topics
  has_many :topics, through: :activity_topics
  accepts_nested_attributes_for :topics

  # accepts_nested_attributes_for :topics, reject_if: proc {|attributes| attributes['name'].blank?}

  validates :title, length: {in: 1..50}
  validates :description, presence: true
  validates :time, presence: true
  validates_associated :category, presence: true
  validates_associated :topics, {message: "needs a topic"}

  def topic_attributes=(topic_attributes)
    activity.topic.build(topic_attributes)

  end

  def self.short_to_long
    self.order(time: :asc)
  end

  def self.alpha
    order(title: :asc)
  end
end
