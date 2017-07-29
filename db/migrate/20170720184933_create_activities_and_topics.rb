class CreateActivitiesAndTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_topics do |t|
      t.belongs_to :activity
      t.belongs_to :topic
    end
  end
end
