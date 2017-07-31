require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'topics=' do
    params = {
      :activity => {
        :title => "Listen",
        :description => "talking and listening",
        :goal => "win",
        :rules => "don't lose",
        :category_id => 2,
        :topics => [
          {:name => "listening"}
        ]
      }
    }

    activity = Activity.new(params[:activity])
    activity.save

    assert_equal activity.topics.size, 1
    assert_equal activity.topics.first.name, "listening"
  end
end
