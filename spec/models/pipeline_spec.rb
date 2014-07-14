# rspec spec/models/pipeline_spec.rb
require 'rails_helper'

RSpec.describe Pipeline, :type => :model do
  
  before(:each) do
    @pipeline = FactoryGirl.create(:pipeline)
    @page = FactoryGirl.create(:page)
  end

  it "should add page successfully" do
    @pipeline.add_page @page
    expect(@pipeline.pages.size).to eq 1
    expect(@pipeline.pages.last).to eq @page
  end

end