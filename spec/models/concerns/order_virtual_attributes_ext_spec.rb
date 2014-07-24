# rspec spec/models/concerns/order_virtual_attributes_ext_spec.rb

require 'rails_helper'

RSpec.describe OrderVirtualAttributesExt, type: :model do
  before :all do
    Log.delete_all
    Order.delete_all

    @order = FactoryGirl.create(:order, email: Faker::Internet.email)
    @new_email = Faker::Internet.email

    pr "#{@order.email} #{@new_email}"

    @params = {
      order:
        {
          email: @new_email,
          locale: "ee",
          test: true,
          custom_key1: "custom_value1", custom_key2: "custom_value2",
          custom_key3: "custom_value3_changed", custom_key4: "custom_value4_changed",
          custom_key5: "custom_value5", custom_key6: "custom_value6"
        }
    }

    Log.create!(key: "custom_value1", value: "custom_value1", order: @order)
    Log.create!(key: "custom_value2", value: "custom_value2", order: @order)
    Log.create!(key: "custom_value3", value: "custom_value3", order: @order)
    Log.create!(key: "custom_value4", value: "custom_value4", order: @order)

    @order.update_accessors_and_virtual_attributes!(@params[:order])
    @order.reload


    @order2 = FactoryGirl.create(:order, email: Faker::Internet.email)
    @params2 = { 
      order:
        {
          custom_key1: "custom_value1",
          data_key: "data_value"
        }
    }
    @order2.update_accessors_and_virtual_attributes!(@params2[:order])
    @order2.reload
  end

  context "Active record fields and attributes are updated, but logs are not created" do
    context "email" do
      it "should have updated attribute" do
        expect(@order.email).to eq @new_email
      end

      it "should have not created log" do
        expect(Log.where(key: "email", value: @new_email, order: @order).size).to eq 0
      end
    end

    context "locale" do
      it "should have updated attribute" do
        expect(@order.locale).to eq "ee"
      end

      it "should have not created log" do
        expect(Log.where(key: "locale", value: "ee", order: @order).size).to eq 0
      end
    end

    context "test" do
      it "should have updated attribute" do
        expect(@order.test).to eq true
      end

      it "should have not created log" do
        expect(Log.where(key: "test", value: true, order: @order).size).to eq 0
      end
    end
  end

  it "should return nil for non-added key" do
    expect(@order.data_key).to eq nil
  end

  #group tests one example at a time
  context "should have not touched values" do
    context "custom_key1" do
      it "key value log size should remain 1" do
        expect(Log.where(key: "custom_key1", value: "custom_value1", order: @order).size).to eq 1
      end
      it "get method should return correct value" do
        expect(@order.custom_key1).to eq "custom_value1"
      end
    end

    context "custom_key2" do
      it "key value log size should remain 1" do
        expect(Log.where(key: "custom_key2", value: "custom_value2", order: @order).size).to eq 1
      end
      it "get method should return correct value" do
        expect(@order.custom_key2).to eq "custom_value2"
      end
    end

  end

  context "should have updated values" do
    context "custom_key3" do
      it "get method should return correct value" do
        expect(@order.custom_key3).to eq "custom_value3_changed"
      end

      it "old key value log size should be 0" do
        expect(Log.where(key: "custom_key3", value: "custom_value3", order: @order).size).to eq 0
      end

      it "new key value log size should be 1" do
        expect(Log.where(key: "custom_key3", value: "custom_value3_changed", order: @order).size).to eq 1
      end
    end
    
    context "custom_key4" do
      it "get method should return correct value" do
        expect(@order.custom_key4).to eq "custom_value4_changed"
      end

      it "old key value log size should be 0" do
        expect(Log.where(key: "custom_key4", value: "custom_value4", order: @order).size).to eq 0
      end

      it "new key value log size should be 1" do
        expect(Log.where(key: "custom_key4", value: "custom_value4_changed", order: @order).size).to eq 1
      end
    end
  end

  context "should have added values (not-existing)" do
    context "custom_key5" do
      it "get method should return correct value" do
        expect(@order.custom_key5).to eq "custom_value5"
      end
      it "key value log size should eq 1" do
        expect(Log.where(key: "custom_key5", value: "custom_value5", order: @order).size).to eq 1
      end
    end
    
    context "custom_key6" do
      it "get method should return correct value" do
        expect(@order.custom_key6).to eq "custom_value6"
      end
      it "key value log size should eq 1" do
        expect(Log.where(key: "custom_key6", value: "custom_value6", order: @order).size).to eq 1
      end
    
      context "other order" do
        context "custom_key1" do
          it "should be able to create record in database" do
            expect(Log.where(key: "custom_key1", value: "custom_value1", order: @order2).size).to eq 1
          end

          it "should have access to key" do
            expect(@order2.custom_key1).to eq "custom_value1"
          end
        end
        context "data_key" do
          it "should be able to create record in database" do
            expect(Log.where(key: "data_key", value: "data_value", order: @order2).size).to eq 1
          end

          it "should have access to key" do
            expect(@order2.data_key).to eq "data_value"
          end

          it "should return nil for non-added key" do
            expect(@order2.custom_value2).to eq nil
          end

        end
      end
    end
  end
end