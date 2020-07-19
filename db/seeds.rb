# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
challenges = [
    {name: "Challenge 1",  description: "The very first challenge"}
]

users = [
    {email: "abc@123.net", password: "abc123"},
    {email: "def@123.net", password: "def123"}
]

admins = [
    {email: "carl@carl.com", password: "carl123"}
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

puts "adding students to first challenge"
pp test_challenge.students << User.all
puts "adding admins  to first challenge"
pp test_challenge.teachers << Admin.all
puts "adding students to first challenge"
pp test_challenge.leaderboard
