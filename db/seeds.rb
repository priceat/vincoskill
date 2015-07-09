require 'faker'

Drill.destroy_all

15.times do 
  Drill.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    pointers: Faker::Lorem.sentence,
    skill_level: "Beginner",
    reps: 25,
    drill_pattern: Faker::Lorem.sentence
    )
end

15.times do 
  Drill.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    pointers: Faker::Lorem.sentence,
    skill_level: "Intermediate",
    reps: 30,
    drill_pattern: Faker::Lorem.sentence
    )
end

15.times do 
  Drill.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    pointers: Faker::Lorem.sentence,
    skill_level: "Advanced",
    reps: 30,
    drill_pattern: Faker::Lorem.sentence
    )
end


puts "Seed finished"
puts "#{Drill.count} drills created"