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

end
