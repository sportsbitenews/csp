FactoryGirl.define do
  factory :page, class: Page do |t|
    t.name Faker::Lorem.word
    t.template Faker::Lorem.word
    t.functionality "static"
  end

  factory :page_order, class: Page do |t|
    t.name Faker::Lorem.word
    t.template Faker::Lorem.word
    t.functionality "order"
  end

  factory :page_checkout, class: Page do |t|
    t.name Faker::Lorem.word
    t.template Faker::Lorem.word
    t.functionality "checkout"
  end

  factory :page_success, class: Page do |t|
    t.name Faker::Lorem.word
    t.template Faker::Lorem.word
    t.functionality "success"
  end
end