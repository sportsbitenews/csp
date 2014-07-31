# rspec spec/controllers/application_controller_spec.rb
require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
  describe "current country" do

    it "should return country with existing country parameter" do
      # routes.draw { post "current_country" => "anonymous#current_country" }
      # post :current_country
      # expect(assigns(:current_country).present?).not_to be true
      # assigns
      # (controller.instance_variable_get(:current_country)).should eql Country.find_by(code: "lv")
      # controller.instance_eval{ @current_country }.should eql Country.find_by(code: "lv")

      # assert_equal Country.find_by(code: "lv"), controller.send(:current_country)
      # expect(subject.current_country).to eq Country.find_by(code: "lv")
    end

    it "should return country by geo location if no country parameter present" do

    end

    it "should return default country if geo location either failed or had no results" do

    end
  end

  describe "current_order" do
  
  end

  describe "current_locale" do

  end

end
