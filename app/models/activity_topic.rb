class ActivityTopic < ApplicationRecord
  belongs_to :activity
  belongs_to :topic
end
