# rspec spec/models/concerns/order_body_formulas_ext_spec.rb

require 'rails_helper'

RSpec.describe OrderBodyFormulasExt, type: :model do
  context "weight functions" do
    before(:all) do
      @order = FactoryGirl.create(:order_with_data)
      @lv = Country.get_main
    end

    describe "height_squared" do
      it "calculates height squared" do
        expect(@order.height_squared).to eq(3.24)
      end
    end

    describe "index" do
      it "calculates index" do
        expect(@order.index).to eq(27.78)
      end
    end

    describe "ideal_index" do
      it "weight not nil" do
        expect(@order.weight).not_to be nil
      end

      it "calculates ideal index" do
        expect(@order.ideal_index).to eq(25.388888888888886)
      end
    end

    describe "ideal_weight" do
      it "calculates ideal weight" do
        expect(@order.ideal_weight).to eq(82)
      end
    end

    describe "goal" do
      it "calculates goal" do
        expect(@order.goal).to eq(-8)
      end
    end

    describe "overweight" do
      it "calculates overweight" do
        expect(@order.overweight).to eq(8)
      end
    end

    describe "similar" do
      it "calculates similar" do
        expect(@order.similar).to eq(82)
      end
    end

    describe "potential" do
      it "calculates potential" do
        expect(@order.potential).to eq(88)
      end
    end
    context "formated" do
      describe "goal" do
        it "returns formatted goal" do
          expect(@order.formatted_goal(@lv)).to eq("- 8")
        end
      end
      describe "weight" do
        it "returns formatted_weight" do
          expect(@order.formatted_weight(@lv)).to eq(90)
        end
      end
      describe "ideal_weight" do
        it "returns formatted ideal weight" do
          expect(@order.formatted_ideal_weight(@lv)).to eq(82)
        end
      end
      describe "height" do
        it "returns formatted height" do
          expect(@order.formatted_height(@lv)).to eq("180 cm")
        end
      end
    end
  end
end