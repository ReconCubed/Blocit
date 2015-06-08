# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
#Create 5 users
5.times do
    user = User.new(
        name:     Faker::Name.name,
        email:    Faker::Internet.email,
        password: Faker::Lorem.characters(10)
    
        )

    user.skip_confirmation!
    user.save!

    end
users = User.all
#Create 50 posts
50.times do
    Post.create!(
        user: users.sample,
        title: Faker::Hacker.abbreviation,
        body: Faker::Hacker.say_something_smart
        )
    end
    posts = Post.all
#Create 100 comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: Faker::Hacker.say_something_smart
        )
    end
    
    puts "Seed finished"
    puts "#{Post.count} posts created"
    puts "#{Comment.count} comments created"
    puts "#{User.count} users created"
    


 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'me@reconcubed.me',
   password: 'helloworld'
 )