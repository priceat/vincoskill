require 'faker'

Drill.destroy_all

15.times do 
  Drill.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    pointers: Faker::Lorem.sentence,
    skill_level: "Beginner"
    )
end

15.times do 
  Drill.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    pointers: Faker::Lorem.sentence,
    skill_level: "Intermediate"
    )
end

15.times do 
  Drill.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    pointers: Faker::Lorem.sentence,
    skill_level: "Advanced"
    )
end


puts "Seed finished"
puts "#{Drill.count} drills created"