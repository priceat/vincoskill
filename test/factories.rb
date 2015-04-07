FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password  "password"
    password_confirmation "password"
    date_of_birth '2015-04-06'
  end

  factory :workout do
    title "Random"
    user
  end
end