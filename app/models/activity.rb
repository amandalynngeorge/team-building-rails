class Activity < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_and_belongs_to_many :topics

  # accepts_nested_attributes_for :topics, reject_if: proc {|attributes| attributes['name'].blank?}

  validates :title, length: {in: 1..50}
  validates :description, presence: true
  validates :time, presence: true
  validates_associated :category, presence: true
  validates_associated :topics, {message: "needs a topic"}

  def topic_attributes=(topic_attributes)
    byebug
  end

  def self.short_to_long
    self.order(time: :asc)
  end

  def self.alpha
    order(title: :asc)
  end
end
