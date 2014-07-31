# rspec spec/models/pipeline_page_spec.rb
require 'rails_helper'

RSpec.describe PipelinePage, :type => :model do

  context "valid" do
    before :all do
      @checkout_page = FactoryGirl.create(:pipeline_page_checkout)
      @success_page = FactoryGirl.create(:pipeline_page_success)

      @checkout_page.add_success_page @success_page
      @checkout_page.add_retry_page @checkout_page
      @checkout_page.add_chance_page @checkout_page

      @checkout_page.reload
      pr @checkout_page.inspect

    end

    it "should have success_page present" do
      expect(@checkout_page.success_pipeline_page).to eq @success_page
    end

    it "should have chance page present" do
      expect(@checkout_page.chance_pipeline_page).to eq @checkout_page
    end

    it "should have retry page present" do
      expect(@checkout_page.retry_pipeline_page).to eq @checkout_page
    end
  end

  context "error" do
    context "should raise error if adding pages to non-checkout page" do
      before :all do
        @checkout_page = FactoryGirl.create(:pipeline_page_checkout)
        @success_page = FactoryGirl.create(:pipeline_page_success)
      end

      it "add_success" do
        expect{@success_page.add_success_page @checkout_page}.to raise_error
      end
      
      it "add_retry" do
        expect{@success_page.add_retry_page @checkout_page}.to raise_error
      end
      it "add_chance" do
        expect{@success_page.add_chance_page @checkout_page}.to raise_error
      end    
    end

    context "should raise error if adding incorrect page type to page" do
      before :all do
        @checkout_page = FactoryGirl.create(:pipeline_page_checkout)
        @success_page = FactoryGirl.create(:pipeline_page_success)
      end

      it "add_success" do
        expect{@checkout_page.add_success_page @checkout_page}.to raise_error
      end
      
      it "add_retry" do
        expect{@checkout_page.add_retry_page @success_page}.to raise_error
      end
      it "add_chance" do
        expect{@checkout_page.add_chance_page @success_page}.to raise_error
      end

    end
  end
end
