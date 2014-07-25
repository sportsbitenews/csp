# rspec spec/controllers/pipelines_controller_spec.rb
require 'rails_helper'

RSpec.describe PipelinesController, :type => :controller do

  before(:all) do
    @pipeline = FactoryGirl.create(:pipeline_with_page)
  end

  describe "routes" do
    it "returns with specify serial" do
      expect(page_path(country: "lv", locale: "lv", serial: "5", title: "landing")).to eq("/lv/lv/p/5/landing")
    end

    it "returns with specify serial and title" do
      expect(pipeline_path(country: "lv", locale: "lv", serial: "12")).to eq("/lv/lv/p/12")
    end
  end

  context "index" do
    [{}, {country: "lv"}, {country: "lv", locale: "lv"}].each do |params|
      it "with params #{params}" do
        get :index, params
        expect(response.status).to eq 301
      end
    end
  end

  it "show" do
    get :show
    expect(response.status).to eq 301
  end

end
