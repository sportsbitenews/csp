# rspec spec/models/concerns/pipeline_pages_ext_spec.rb

require 'rails_helper'

RSpec.describe PipelinePagesExt, type: :model do
  before(:all) do
    @pipeline = FactoryGirl.create(:pipeline)
    
    @page = FactoryGirl.create(:page)
    @page2 = FactoryGirl.create(:page)

    @page_name = @page.name
    @page2_name = @page2.name

    @pipeline.add_page @page
    @pipeline.add_page @page2

    @pipeline_page1 = PipelinePage.find_by(page: @page, pipeline: @pipeline)
    @pipeline_page2 = PipelinePage.find_by(page: @page2, pipeline: @pipeline)

    @pipeline_page1.update_attributes(title: Faker::Lorem.word)
    @pipeline_page2.update_attributes(title: Faker::Lorem.word)

    @pipeline_page1.set_sequencer 1
    @pipeline_page2.set_sequencer 2

    @pipeline_page1.reload
    @pipeline_page2.reload

    @pipeline_page1_title = @pipeline_page1.title
    @pipeline_page2_title = @pipeline_page2.title
  end

  it "should add successfully" do
    expect(@pipeline.pages.size).to eq 2
    expect(@pipeline.pages.first).to eq @page
    expect(@pipeline.pages.last).to eq @page2
  end

  it "should find pipeline first page successfully" do
    expect(@pipeline.get_first_page).to eq @page
  end

  describe "page finding by sequencer" do

    context "should return correct page by sequencer" do 
      it "1" do
        expect(@pipeline.get_page_by_sequencer 1).to eq @page
      end
      it "2" do
        expect(@pipeline.get_page_by_sequencer 2).to eq @page2
      end
    end

    it "should return nil if page with sequencer not present" do
      expect(@pipeline.get_page_by_sequencer 3).to be nil
    end

    it "should raise error if something else than int passed as param" do
      expect{ @pipeline.get_page_by_sequencer "string" }.to raise_error
    end

  end

  describe "should return page by pipeline page title" do
    it "existing page1 with title #{@pipeline_page1_title}" do
      expect(@pipeline.get_page_by_title @pipeline_page1_title).to eq @page
    end

    it "existing page2 with title #{@pipeline_page2_title}" do
      expect(@pipeline.get_page_by_title @pipeline_page2_title).to eq @page2
    end

    it "nonexistent page" do
      expect(@pipeline.get_page_by_title "nonexistent").to eq nil
    end
  end

end