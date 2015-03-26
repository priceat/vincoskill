require 'faker'

Drill.destroy_all

50.times do 
  Drill.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    pointers: Faker::Lorem.sentence,
    )
end

puts "Seed finished"
puts "#{Drill.count} drills created"