require 'faker'

#Create Test User 1
user_1 = User.new(
  name:     'User One',
  email:    'user_1@example.com',
  password: 'helloworld',
  )
user_1.save!

#Create Test User 2
user_2 = User.new(
  name:     'User Two',
  email:    'user_2@example.com',
  password: 'helloworld',
  )
user_2.save!

#Create Test User 3
user_3 = User.new(
  name:     'User Three',
  email:    'user_3@example.com',
  password: 'helloworld',
  )
user_3.save!

users = User.all

15.times do 
  Item.create!(
    user: users.sample,
    description: Faker::Lorem.sentence,
    status: 'Pending',
    due_date: rand(10.minutes .. 7.days).ago,
    )
end

puts "Seed finished"
puts "#{Item.count} items created."