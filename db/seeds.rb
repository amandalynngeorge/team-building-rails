# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "Ice Breaker")
Category.create(name: "Active Team Initiative")
Category.create(name: "Problem Solving Initiative")
Category.create(name: "Trust Activity")
Category.create(name: "Debrief")


Topic.create(name: "Running")
Topic.create(name: "Communication")
Topic.create(name: "Team building")

Activity.create(title: "Whale Watch", description: "Using non-verbal communication, have everyone board and balance the platform.", goal: "Balance the board for a given amount of time and work on non-verbal communication.", rules: "Once a person boards the platform there is no talking. If someone talks everyone steps down and starts over.", time: 10, category_id: 3)
