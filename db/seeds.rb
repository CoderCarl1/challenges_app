# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
challenges = [
    {name: "Challenge 1",  description: "The very first challenge"}
]

users = [
    {email: "abc@coderacademy.edu.au", password: "abc123"},
    {email: "def@coderacademy.edu.au", password: "def123"}
]

admins = [
    {email: "carl.davidson@coderacademy.edu.au", password: "carl123"}
]

puts "===DESTROYING EXISTING DATA==="
Admin.destroy_all
User.destroy_all
Leaderboard.destroy_all
Challenge.destroy_all

puts "===SEEDING==="
puts "---USERS---"
pp User.create!(users)
puts "---ADMINS---"
pp Admin.create!(admins)
puts "---CHALLENGES---"
pp Challenge.create(challenges)
puts "===TESTS==="
puts "creating test challenge and adding users"
pp test_challenge = Challenge.find_by(name: "Challenge 1")
puts "adding test students to first challenge"
pp test_challenge.students << User.all
puts "adding admins to first challenge"
pp test_challenge.teachers << Admin.all
puts "Showing the current leaderboard"
pp test_challenge.leaderboard
puts "Showing the current leaderboard and students"
pp test_challenge.leaderboard.students
