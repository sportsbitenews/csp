# rspec spec/models/page_spec.rb
require 'rails_helper'

RSpec.describe Page, :type => :model do

  describe "functionality" do
    ["static", "order", "checkout", "success"].each do |functionality|
      context "#{functionality}" do
        before(:all) do
          @page = FactoryGirl.create(:page, functionality: functionality)
        end

        it "should match functionality variable" do
          expect(@page.functionality).to eq functionality
        end
        
      end
    end
  end


end
