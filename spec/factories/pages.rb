FactoryGirl.define do
  factory :page, class: Page do |t|
    t.name Faker::Lorem.word
    t.template Faker::Lorem.word
    t.functionality "static"
  end
  
end