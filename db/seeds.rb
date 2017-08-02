Category.create(name: "Ice Breaker")
Category.create(name: "Active Team Initiative")
Category.create(name: "Problem Solving Initiative")
Category.create(name: "Trust Activity")
Category.create(name: "Debrief")

Topic.create(name: "Communication")
Topic.create(name: "Running")
Topic.create(name: "Team building")

Activity.create(
  title: "Whale Watch",
  description: "Using non-verbal communication, have everyone board and balance the platform.",
  goal: "Balance the board for a given amount of time and work on non-verbal communication.",
  rules: "Once a person boards the platform there is no talking. If someone talks everyone steps down and starts over.",
  time: 10,
  category_id: 3,
  topics_attributes: {"0" => {name: "Non-verbal Communication"}}
)
