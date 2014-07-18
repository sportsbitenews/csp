# rspec spec/controllers/pipelines_controller_spec.rb
require 'rails_helper'

RSpec.describe PipelinesController, :type => :controller do

  before(:all) do
    FactoryGirl.create(:pipeline_with_page)
  end

  describe "routes" do
    it "returns with specify serial" do
      expect(page_path(country: "lv", locale: "lv", serial: "5", title: "landing")).to eq("/lv/lv/p/5/landing")
    end

    it "returns with specify serial and title" do
      expect(pipeline_path(country: "lv", locale: "lv", serial: "12")).to eq("/lv/lv/p/12")
    end
  end

  it "index" do
    get :index
    expect(response.status).to eq 301
  end

  it "show" do
    get :show
    expect(response.status).to eq 301
  end

end
