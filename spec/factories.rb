FactoryBot.define do
  factory :user, class: User do
    email {"joe@gmail.com"}
    password {"blach1213"}
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end
