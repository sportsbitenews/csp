# rspec spec/models/concerns/order_google_analytics_ext_spec.rb

require 'spec_helper'

RSpec.describe OrderGoogleAnalyticsExt, type: :model do

  before(:all) do
    @order = FactoryGirl.create(:order)
    pr @order.inspect
  end

  context "returns correct ga param" do
    it "source" do
      expect(@order.source).to eq "test_source"
    end
    it "medium" do
      expect(@order.medium).to eq "test_medium"
    end
    it "term" do
      expect(@order.term).to eq "test_term"
    end
    it "content" do
      expect(@order.content).to eq "test_content"
    end
    it "campaign" do
      expect(@order.campaign).to eq "test_campaign"
    end
  end

  context "can find by param" do
    xit "source" do
      expect(Order.find_by(source: "test_source")).to eq @order
    end
    xit "medium" do
      expect(Order.find_by(medium: "test_medium")).to eq @order
    end
    xit "term" do
      expect(Order.find_by(term: "test_term")).to eq @order
    end
    xit "content" do
      expect(Order.find_by(content: "test_content")).to eq @order
    end
    xit "campaign" do
      expect(Order.find_by(campaign: "test_campaign")).to eq @order
    end

  end

end