# rspec spec/controllers/pipelines_controller_spec.rb
require 'rails_helper'

RSpec.describe PipelinesController, :type => :controller do
  it "does the trick" do
    post :index
    expect(response.status).to eq 301
  end

  it "does the trick" do
    post :show
    expect(response.status).to eq 301
  end


  # describe "finds correct pipeline" do
  #   it "without country and locale" do
  #     post :index
  #     expect(response.status).to eq 200
  #   end

  #   context "existent" do
  #     it "with country" do
  #       post :index, {country: "lv"}
  #       expect(response.status).to eq 200
  #     end

  #     it "with country and locale" do
  #       post :index, {country: "lv", locale: "lv"}
  #       expect(response.status).to eq 200
  #     end
  #   end

  #   context "non-existent" do
  #     it "with country" do
  #       post :index, {country: "tv"}
  #       expect(response.status).to eq 200
  #     end
      
  #     it "with country and locale" do
  #       post :index, {country: "tv", locale: "tv"}
  #       expect(response.status).to eq 200
  #     end
      
  #     it "with country and existent locale" do
  #       post :index, {country: "tv", locale: "lv"}
  #       expect(response.status).to eq 200
  #     end
      
  #     it "with existent country and locale" do
  #       post :index, {country: "lv", locale: "tv"}
  #       expect(response.status).to eq 200
  #     end
  #   end
  # end

end
