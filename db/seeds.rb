require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all


User.create!(username: "Freeda Grimes")
User.create!(username: "Ms. Hermina Rosenbaum")
User.create!(username: "Colby Satterfield")


Poll.create!(title: "im the first", author_id: 1)
Poll.create!(title: Faker::Food.dish, author_id: 2)



2.times do
  Question.create!( text: "#{Faker::Hacker.say_something_smart}?", poll_id: 1)
end

2.times do
  Question.create!( text: "#{Faker::Hacker.say_something_smart}?", poll_id: 2)
end

random = rand(1..4)
AnswerChoice.create!( text: "#{Faker::Hacker.noun}", question_id: random )
random = rand(1..4)
AnswerChoice.create!( text: "#{Faker::Hacker.noun}", question_id: random )

random_user = rand(1..2)
random_answer = rand(1..2)
Response.create!( user_id: random_user, answer_choice_id: random_answer)
random_user = rand(1..2)
random_answer = rand(1..2)
Response.create!( user_id: random_user, answer_choice_id: random_answer)
