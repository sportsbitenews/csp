FactoryGirl.define do
  factory :completed_payment, class: Payment do |f|
    f.status "Completed"
    f.identifier Faker::Lorem.characters(15)
    f.order
  end

  factory :payment, class: Payment do |f|
    f.status "new"
    f.identifier Faker::Lorem.characters(15)
    f.amount Faker::Number.number(2)
    f.amount_in_euro Faker::Number.number(1)
    f.currency Faker::Lorem.characters(3).upcase
    f.provider Faker::Lorem.words.join
    f.provider_params Faker::Lorem.sentence(3)
    f.mapped_params Faker::Lorem.sentence(3)
    f.snd_acc Faker::Lorem.words.join
    f.snd_name Faker::Name.name
    f.custom_info Faker::Lorem.sentence(3)
  end

end