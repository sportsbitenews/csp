# rspec spec/models/concerns/order_category_ext_spec.rb

require 'rails_helper'

RSpec.describe OrderCategoryExt, type: :model do

  context "category should be assigned correctly" do
    before :each do
      Order.destroy_all
    end

    it "with completely different emails assigns different categories" do
      (1..10).each do |idx|
        expect(FactoryGirl.create(:order, email: Faker::Internet.email).category).to eq idx
      end

      (11..20).each do |idx|
        expect(FactoryGirl.create(:order, email: Faker::Internet.email).category).to eq (idx - 10)
      end
    end

    it "with same emails return same category" do
      duplicate_email = Faker::Internet.email
      expect(FactoryGirl.create(:order, email: Faker::Internet.email).category).to eq 1
      expect(FactoryGirl.create(:order, email: duplicate_email).category).to eq 2
      expect(FactoryGirl.create(:order, email: duplicate_email).category).to eq 2
      expect(FactoryGirl.create(:order, email: Faker::Internet.email).category).to eq 3
    end

  end
end