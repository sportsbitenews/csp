FactoryGirl.define do
  factory :pipeline, class: Pipeline do |t|
    t.locale "lv"
    t.status "active"
    t.serial "serial"
    t.group "norden"
    t.main false
    t.product {FactoryGirl.create(:product)}
    t.country {Country.find_by(code: "lv")}
  end

  factory :pipeline_with_page, class: Pipeline do |t|
    t.locale "lv"
    t.status "active"
    t.serial "serial"
    t.group "norden"
    t.main false
    t.product {FactoryGirl.create(:product)}
    t.country {Country.find_by(code: "lv")}

    after(:create) do |instance|
      page = FactoryGirl.create(:page)
      instance.add_page page
      instance.pipeline_pages.find_by(page: page).update_attributes!(title: "page_title", sequencer: 1)
    end
  end
end