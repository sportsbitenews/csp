FactoryGirl.define do
  factory :pipeline, class: Pipeline do |t|
    t.locale "lv"
    t.status "active"
    t.serial "serial"
    t.group "norden"
    t.main false
    t.product {FactoryGirl.create(:product)}
    t.country {Country.find_by(code: "lv")}
  end
end