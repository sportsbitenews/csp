FactoryGirl.define do
  factory :pipeline, class: Pipeline do |t|
    t.locale "lv"
    t.status "active"
    t.serial "serial"
    t.product {FactoryGirl.create(:product)}
    t.country {FactoryGirl.create(:country_lv)}
  end
end