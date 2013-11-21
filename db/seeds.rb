# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'


rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  u.skip_confirmation!
  u.save

rand(10..30).times do
  a = Album.create(title: Faker::Lorem.words(rand(1..10)).join(" ")) 
  a.update_attribute(:user_id, rand(2..5))
  a.update_attribute(:transition_time, rand(500..1000))
  rand(3..10).times do
    a.sources.create(url: Faker::Lorem.words(rand(1..3)).join("\n"))
    end
  end
end

u = User.first
u.skip_reconfirmation!
u.update_attributes(email: 'seucroch@hotmail.com', password: 'helloworld', password_confirmation: 'helloworld')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Album.count} albums created"
puts "#{Source.count} sources created"