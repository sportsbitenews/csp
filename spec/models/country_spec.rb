# rspec spec/models/country_spec.rb
require 'rails_helper'

RSpec.describe Country, :type => :model do

  it "should return LV country" do
    expect(Country.get_main).to eq Country.find_by(code: "lv")
  end

end
