FactoryGirl.define do
  factory :product, class: Product do |t|
    t.name Faker::Lorem.word
    t.url Faker::Internet.url
  end
end