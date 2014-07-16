# rspec spec/lib/google_analytics_api_spec.rb
require 'rails_helper'

describe GoogleAnalyticsApi do
  before(:all) do
    GoogleAnalytics.delete_all
  end

  describe "initialize" do
    context "should have cid" do
      before(:each) do
        @cid = Faker::Number.number(6)
        @backup_cid = Faker::Number.number(6)
      end

      it "if its passed without a backup cid" do
        expect((GoogleAnalyticsApi.new @cid).cid).to eq @cid
      end

      it "if its passed with a backup cid" do
        expect((GoogleAnalyticsApi.new @cid, @cid).cid).to eq @cid
      end


      it "if both cid and backup cid present, backup cid doesnt override cid" do
        expect((GoogleAnalyticsApi.new @cid, @backup_cid).cid).to eq @cid
      end

      it "if none passed but has a backup cid" do
        expect((GoogleAnalyticsApi.new nil, @backup_cid).cid).to eq @backup_cid
      end
    end
  end

  describe "creates GA record correctly" do
    before(:each) do
      @cid = Faker::Number.number(6)
      @ga = GoogleAnalyticsApi.new @cid
    end

    context "event" do
      context "is present" do
        before (:each) do
          @category = Faker::Lorem.characters(10)
          @action = Faker::Lorem.characters(10)
        end

        it "with category and action" do
          @ga.add_event @category, @action
          ga = GoogleAnalytics.find_by(category: "event", status: "sent")

          data = eval(ga.data).symbolize_keys

          expect(data[:cid]).to eq @cid
          expect(data[:t]).to eq "event"
          expect(data[:ea]).to eq @action
          expect(data[:ec]).to eq @category
        end
      end
    end

    context "item" do
      context "is present" do
        before (:each) do
          @payment = FactoryGirl.create(:completed_payment)
          @item_sku = Faker::Lorem.characters(10)
          @price = Faker::Number.number(1)
          @amount = Faker::Number.number(1)
          @name = Faker::Lorem.characters(10)
          @category = Faker::Lorem.characters(10)
        end

        it "with trans_id, item_sku, price, quantity " do
          @ga.add_item @payment.id, @item_sku, @price, @quantity

          ga = GoogleAnalytics.find_by(category: "item", status: "sent")

          data = eval(ga.data).symbolize_keys

          expect(data[:cid]).to eq @cid
          expect(data[:t]).to eq "item"
          expect(data[:ti]).to eq @payment.id
          expect(data[:in]).to eq nil
          expect(data[:ip]).to eq @price
          expect(data[:iq]).to eq @quantity
          expect(data[:ic]).to eq @item_sku
          expect(data[:iv]).to eq nil

        end

        it "with trans_id, item_sku, price, quantity present, name, category present" do
          @ga.add_item @payment.id, @item_sku, @price, @quantity, @name, @category

          ga = GoogleAnalytics.find_by(category: "item", status: "sent")

          data = eval(ga.data).symbolize_keys

          expect(data[:cid]).to eq @cid
          expect(data[:t]).to eq "item"
          expect(data[:ti]).to eq @payment.id
          expect(data[:in]).to eq @name
          expect(data[:ip]).to eq @price
          expect(data[:iq]).to eq @quantity
          expect(data[:ic]).to eq @item_sku
          expect(data[:iv]).to eq @category
        end
      end
    end
    
    context "payment" do
      context "is present" do
        before (:each) do
          @payment = FactoryGirl.create(:completed_payment)
          @total = Faker::Number.number(1)
        end

        it "with trans_id and total" do
          @ga.add_transaction @payment.id, @total
          ga = GoogleAnalytics.find_by(category: "transaction", status: "sent")

          data = eval(ga.data).symbolize_keys

          expect(data[:cid]).to eq @cid
          expect(data[:t]).to eq "transaction"
          expect(data[:ti]).to eq @payment.id
          expect(data[:tr]).to eq @total.to_i
          expect(ga.payment).to eq @payment
        end
      end
    end
  end
end