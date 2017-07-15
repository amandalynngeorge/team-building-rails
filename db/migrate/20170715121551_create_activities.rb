class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.text :goal
      t.text :rules
      t.integer :time
      t.integer :category_id
      t.integer :user_id
    end
  end
end
