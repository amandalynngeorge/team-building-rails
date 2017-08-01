class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :activity_topics
  has_many :topics, through: :activity_topics

  validates :title, length: {in: 1..50}
  validates :description, presence: true
  validates :time, presence: true
  validates_associated :category, presence: true
  validates_associated :topics, presence: true

  def topics_attributes=(topics_attributes)
    topics_attributes.each do |i, topic_attributes|
      if topic = Topic.find_by(name: topic_attributes[:name])
        self.topics << topic
      else
        self.topics.build(topic_attributes)
      end
    end
  end

  def self.short_to_long
    all.order(time: :asc)
  end

  def self.alpha
    order(title: :asc)
  end
end
