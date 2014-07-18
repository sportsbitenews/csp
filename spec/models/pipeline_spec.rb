# rspec spec/models/pipeline_spec.rb
require 'rails_helper'

RSpec.describe Pipeline, :type => :model do

  #domain country locale main
  describe "locating default pipeline" do

    # Search main page in country  and locale
    # Search by country and locale
    # Search by main country
    # Search by country
    #fallback

    ["norden", "swiss"].each do |group|
      context "#{group}" do
        it "should return main country, locale pipeline" do

          main_locale_ctry_pipeline = FactoryGirl.create(:pipeline, locale: "lv", country_id: Country.get_main.id, main: true, group: group)
          main_locale_ctry_pipeline_lt = FactoryGirl.create(:pipeline, locale: "lv", country_id: Country.find_by(code: "lt"), main: true, group: group)
          locale_ctry_pipeline = FactoryGirl.create(:pipeline, locale: "lv", country_id: Country.get_main.id)
          main_ctry_pipeline = FactoryGirl.create(:pipeline, locale: "es", country_id: Country.get_main.id, main: true, group: group)
          ctry_pipeline = FactoryGirl.create(:pipeline, locale: "es", country_id: Country.get_main.id, group: group)
          pipeline = FactoryGirl.create(:pipeline, group: group)

          expect(Pipeline.locate domain: group, country: Country.get_main, locale: "lv").to eq main_locale_ctry_pipeline
        end
        it "should return country and locale that isnt main, if there is no country/locale main pipeline" do

          main_locale_ctry_pipeline_lt = FactoryGirl.create(:pipeline, locale: "lv", country_id: Country.find_by(code: "lt"), main: true, group: group)
          locale_ctry_pipeline = FactoryGirl.create(:pipeline, locale: "lv", country_id: Country.get_main.id)
          main_ctry_pipeline = FactoryGirl.create(:pipeline, locale: "es", country_id: Country.get_main.id, main: true, group: group)
          ctry_pipeline = FactoryGirl.create(:pipeline, locale: "es", country_id: Country.get_main.id, group: group)

          expect(Pipeline.locate domain: group, country: Country.get_main, locale: "lv").to eq locale_ctry_pipeline
        end
        it "should return by main country pipe" do
          
          main_locale_ctry_pipeline_lt = FactoryGirl.create(:pipeline, locale: "lv", country_id: Country.find_by(code: "lt"), main: true, group: group)
          main_ctry_pipeline = FactoryGirl.create(:pipeline, locale: "es", country_id: Country.get_main.id, main: true, group: group)
          ctry_pipeline = FactoryGirl.create(:pipeline, locale: "es", country_id: Country.get_main.id, group: group)

          expect(Pipeline.locate domain: group, country: Country.get_main, locale: "lv").to eq main_ctry_pipeline
        end
        it "should return pipeline by country only" do
          
          main_locale_ctry_pipeline_lt = FactoryGirl.create(:pipeline, locale: "lv", country_id: Country.find_by(code: "lt"), main: true, group: group)
          ctry_pipeline = FactoryGirl.create(:pipeline, locale: "es", country_id: Country.get_main.id, group: group)

          expect(Pipeline.locate domain: group, country: Country.get_main, locale: "lv").to eq ctry_pipeline
        end

        it "should fallback" do
          pipeline = FactoryGirl.create(:pipeline, group: group)

          expect(Pipeline.locate domain: group, country: Country.get_main, locale: "lv").to eq pipeline
        end
      end
    end

    # [[true, @main_pipeline], [false, @pipeline].each do |main, pipeline|
    #   context "main is #{main}" do
        
    #     it "correct country, correct locale" do
    #       # expect(Pipeline.locate country: "lv", locale: "lv", main: main).to eq 
    #     end

    #     it "correct country, incorrect locale" do
        
    #     end

    #     it "incorrect country, incorrect locale" do
        
    #     end

    #     it "correct country" do
        
    #     end

    #     it "incorrect locale" do
        
    #     end 

    #     it "without params" do
        
    #     end
    #   end
    # end

  end
end