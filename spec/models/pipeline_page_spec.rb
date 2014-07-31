# rspec spec/models/pipeline_page_spec.rb
require 'rails_helper'

RSpec.describe PipelinePage, :type => :model do
  it "should create new page_function" do
    FactoryGirl.create(:pipeline_page_checkout)
  end

  
end
