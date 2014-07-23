FactoryGirl.define do
  factory :tag, class: Tag do |t|
    t.name Faker::Lorem.word
  end
end