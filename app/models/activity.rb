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
    #params = "activity"=>{
      # "title"=>"ffer",
      # "description"=>"df",
      # "goal"=>"e",
      # "rules"=>"fe",
      # "time"=>"9",
      # "category_id"=>"1",
      # "topics_attributes"=>{
        #"0"=>{"name"=>"fejk"}}
      #}
    topics_attributes.each do |i, topic_attributes|
        self.topics.build(topic_attributes)
    end
  end

  def self.short_to_long
    self.order(time: :asc)
  end

  def self.alpha
    order(title: :asc)
  end
end
