# rspec spec/models/pipeline_page_spec.rb
require 'rails_helper'

RSpec.describe PipelinePage, :type => :model do
  it "should create new page_function group when pipeline_page is created" do
    expect(FactoryGirl.create(:pipeline_page_checkout).page_function_group).not_to be nil
  end

  
end
