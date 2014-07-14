# rspec spec/models/system_job_spec.rb
require 'rails_helper'

RSpec.describe SystemJob, :type => :model do
  describe "initiate" do
    before(:all) do
      @system_job = SystemJob.initiate job_type: "test_job"
    end

    it "should set status automatically to new" do
      expect(@system_job.status).to eq "new"
    end

    it "method should assign test_job to object" do
      expect(@system_job.job_type).to eq "test_job"
    end
  end

  describe "complete" do
    before(:all) do
      @system_job = SystemJob.initiate job_type: "test_job"
      @desc = Faker::Lorem.characters(300)
      @system_job.complete item_amount: 2, description: @desc
      @system_job.reload
    end
    
    it "should have description" do
      expect(@system_job.description).to eq @desc
    end

    it "should have item amount" do
      expect(@system_job.item_amount).to eq 2
    end

    it "should have status done" do
      expect(@system_job.status).to eq "completed"
    end

    it "should have completed_at" do
      expect(@system_job.completed_at.today?).to be true
    end


  end

end
