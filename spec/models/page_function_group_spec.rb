# rspec spec/models/page_function_group_spec.rb
require 'rails_helper'

RSpec.describe PageFunctionGroup, :type => :model do
  it "should create new page_function group when pipeline_page is created" do
    expect(FactoryGirl.create(:pipeline_page_checkout).page_function_group).not_to be nil
  end


end