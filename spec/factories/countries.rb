FactoryGirl.define do
  factory :country_lv, class: Country do |t|
    t.code "lv"
    t.title "Latvia"
  end
  factory :country_lt, class: Country do |t|
    t.code "lt"
    t.title "Lithuania"
  end
  factory :country_et, class: Country do |t|
    t.code "ee"
    t.title "Estonia"
  end
end