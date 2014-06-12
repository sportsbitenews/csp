# rspec spec/models/pipeline_spec.rb
require 'spec_helper'

RSpec.describe Pipeline, :type => :model do
  it "should add page successfully" do
    FactoryGirl.create(:pipeline)
  end
end
