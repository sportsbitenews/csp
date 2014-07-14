FactoryGirl.define do
  factory :completed_transaction, class: Transaction do
    status "Completed"
    transaction_id Faker::Lorem.characters(15)
  end

  factory :transaction, class: Transaction do
    status "new"
    identifier Faker::Lorem.characters(15)
    amount Faker::Number.number(2)
    amount_in_euro Faker::Number.number(1)
    currency Faker::Lorem.characters(3).upcase
    provider Faker::Lorem.words.join
    provider_params Faker::Lorem.sentence(3)
    mapped_params Faker::Lorem.sentence(3)
    snd_acc Faker::Lorem.words.join
    snd_name Faker::Name.name
    custom_info Faker::Lorem.sentence(3)
  end

end