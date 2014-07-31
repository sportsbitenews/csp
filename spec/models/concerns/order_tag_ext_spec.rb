# rspec spec/models/concerns/order_tag_ext_spec.rb

require 'rails_helper'

RSpec.describe OrderTagExt, type: :model do
  context "add_tag" do
    before :all do
      @order = FactoryGirl.create(:order)
      @existing_tag = Faker::Lorem.word
      @new_tag = Faker::Lorem.word
      @order.add_tag @new_tag
      @order.add_tag @existing_tag
      @order.add_tag @new_tag
      @order.add_tag @existing_tag
    end

    context "existing tag" do
      it "should not create duplicates" do
        expect(Log.where(order: @order, key: "tag", value: @existing_tag).size).to eq 1
      end

    end

    context "non-existing tag" do
      it "should not create duplicates" do
        expect(Log.where(order: @order, key: "tag", value: @new_tag).size).to eq 1
      end
    end

  end

  context "remove_tag" do
    before :all do
      @order = FactoryGirl.create(:order, email: Faker::Internet.email)
      @existing_tag = Faker::Lorem.word
      @order.add_tag @existing_tag
      @order.remove_tag @existing_tag
    end

    it "should have no order tag once removed" do
      expect(Log.where(order: @order, key: "tag", value: @existing_tag).size).to eq 0
    end
  end 
end