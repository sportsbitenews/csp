FactoryGirl.define do
  factory :order, class: Order do |t|
    t.email Faker::Internet.email
    t.status "new"
    t.locale "lv"
    t.ga_data {{source: "test_source", medium: "test_medium", term: "test_term", content: "test_content", campaign: "test_campaign"}.to_s}
  end
end