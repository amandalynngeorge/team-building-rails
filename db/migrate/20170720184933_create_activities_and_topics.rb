class CreateActivitiesAndTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :activities_and_topics do |t|
      t.belongs_to :activity, index: true
      t.belongs_to :topic, index: true
    end
  end
end
