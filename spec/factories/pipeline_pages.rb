FactoryGirl.define do
  factory :pipeline_page_checkout, class: PipelinePage do |t|
    t.title Faker::Lorem.word
    t.sequencer 1
    t.page { FactoryGirl.create(:page_checkout) }
    t.pipeline { FactoryGirl.create(:pipeline) } 
  end

  factory :pipeline_page_success, class: PipelinePage do |t|
    t.title Faker::Lorem.word
    t.sequencer 1
    t.page { FactoryGirl.create(:page_success) }
    t.pipeline { FactoryGirl.create(:pipeline) } 
  end

  factory :pipeline_page_order, class: PipelinePage do |t|
    t.title Faker::Lorem.word
    t.sequencer 1
    t.page { FactoryGirl.create(:page_order) }
    t.pipeline { FactoryGirl.create(:pipeline) } 
  end

  factory :pipeline_page_static, class: PipelinePage do |t|
    t.title Faker::Lorem.word
    t.sequencer 1
    t.page { FactoryGirl.create(:page) }
    t.pipeline { FactoryGirl.create(:pipeline) } 
  end


end