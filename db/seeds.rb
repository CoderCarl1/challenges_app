# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

challenges = [
    {name: "Challenge 1" , slug: "Challenge-1",  description: "The very first challenge", points: "1" }
]

users = [
    {email: "abc@123.net", password: "abc123"}
]

admins = [
    {email: "carl@carl.com", password: "carl123"}
]
Admin.destroy_all
User.destroy_all
Challenge.destroy_all

User.create(users)
Admin.create(admins)
Challenge.create(challenges)

# Challenge.first.students
# Challenge.first.teachers


# Challenge.first.users: << User.first
# Challenge.first.admins: << Admin.first