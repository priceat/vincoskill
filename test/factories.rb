FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password  "password"
    password_confirmation "password"
    date_of_birth '2013-04-06'
    years_played 3
    role "player"
  end
  factory :drill do 
    name do 
      Faker::Lorem.sentence
    end
    description do 
      Faker::Lorem.sentence
    end
    pointers do 
      Faker::Lorem.sentence
    end
      skill_level "Beginner"
      # sequence :id do |n|
      #   "{n}"
      # end
  end
  factory :workout do
    title "Random"
    user
  end
  factory :workout_drill do
    workout
  end
end