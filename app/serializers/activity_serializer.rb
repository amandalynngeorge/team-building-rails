class ActivitySerializer < ActiveModel::Serializer
  # attributes :id, :title, :description, :goal, :rules, :time
  # belongs_to :category
  # belongs_to :user
  # has_many :topics

  def self.serialize(activity)

    # start with the open brace to create a valid JSON object
    serialized_activity = '{'

    serialized_activity += '"id": ' + activity.id.to_s + ', '
    serialized_activity += '"title": "' + activity.title + '", '
    serialized_activity += '"description": "' + activity.description + '", '
    serialized_activity += '"goal": "' + activity.goal + '", '
    serialized_activity += '"rules": "' + activity.rules + '", '
    serialized_activity += '"time": "' + activity.time.to_s + '", '
    serialized_activity += '"category": {'
    serialized_activity += '"name": "' + activity.category.name + '"}'

    # and end with the close brace
    serialized_activity += '}'
  end
end
