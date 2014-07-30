FactoryGirl.define do
  factory :order, class: Order do |t|
    t.email Faker::Internet.email
    t.status "new"
    t.locale "lv"
    t.ga_data {{source: "test_source", medium: "test_medium", term: "test_term", content: "test_content", campaign: "test_campaign"}.to_s}
  end

  factory :order_with_data, class: Order do |t|
    t.email Faker::Internet.email
    t.locale "lv"

    before(:create) do |instance|
      instance.update_accessors_and_virtual_attributes!(
        country: Country.get_main,
        locale: "lv",
        name: "Foo",
        weight: 90,
        height: 180,
        gender: "male",
        age: 30
      )
    end
  end


end