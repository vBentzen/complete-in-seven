# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Users
10.times do
  User.create!(
          email: Faker::Internet.email,
          password: "Flamingofir3",
          password_confirmation: "Flamingofir3",
          confirmed_at: Time.now
  )
end
users = User.all

# Create items
100.times do
  Item.create!(
          user: users.sample,
          name: Faker::WorldOfWarcraft.hero,
          created_at: "2017-11-3 11:11:00"
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"