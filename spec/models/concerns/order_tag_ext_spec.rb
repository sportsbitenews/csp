# rspec spec/models/concerns/order_tag_ext_spec.rb

require 'rails_helper'

RSpec.describe OrderTagExt, type: :model do
  before :all do
    Tag.delete_all
  end

  context "add_tag" do
    before :all do
      @order = FactoryGirl.create(:order)
      @existing_tag = FactoryGirl.create(:tag)
      @new_tag = Faker::Lorem.word
      @order.add_tag @new_tag
      @order.add_tag @existing_tag.name
      @order.add_tag @new_tag
      @order.add_tag @existing_tag.name
    end

    context "existing tag" do
      it "should not create duplicates" do
        expect(Tag.where(name: @existing_tag.name).size).to eq 1
      end

      it "should add tag once" do
        expect(@order.tags.where(name: @existing_tag.name).size).to eq 1
      end
    end

    context "non-existing tag" do
      it "should not create duplicates" do
        expect(Tag.where(name: @new_tag).size).to eq 1
      end

      it "should add tag once" do
        expect(@order.tags.where(name: @new_tag).size).to eq 1
      end
    end

  end

  context "remove_tag" do
    before :all do
      @order = FactoryGirl.create(:order, email: Faker::Internet.email)
      @existing_tag = FactoryGirl.create(:tag, name: Faker::Lorem.word)
      @order.add_tag @existing_tag.name
      @order.remove_tag @existing_tag.name
    end

    it "should have no order tag once removed" do
      expect(@order.tags.where(name: @existing_tag.name).size).to eq 0
    end

    it "should have present tag after removal from order" do
      expect(Tag.where(name: @existing_tag.name).size).to eq 1
    end
  end 
end