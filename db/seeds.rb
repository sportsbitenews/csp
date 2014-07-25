Country.find_or_create_by({title: "Latvia", code: "lv", main: true})
Country.find_or_create_by({title: "Lithuania", code: "lt"})
Country.find_or_create_by({title: "Estonia", code: "ee"})
Country.find_or_create_by({title: "Poland", code: "pl"})
Country.find_or_create_by({title: "United Kingdom", code: "gb"})
Country.find_or_create_by({title: "Ireland", code: "ie"})
Country.find_or_create_by({title: "Finland", code: "fi"})
Country.find_or_create_by({title: "Denmark", code: "dk"})
Country.find_or_create_by({title: "USA", code: "us"})

FunctionGroup.find_or_create_by(name: "static")
FunctionGroup.find_or_create_by(name: "order")
FunctionGroup.find_or_create_by(name: "checkout")
FunctionGroup.find_or_create_by(name: "success")

if Rails.env.development?
  pipe = Pipeline.find_or_create_by(locale: "lv", status: "active", serial: "1", group: "norden", main: true, country: Country.get_main)
  landing_page = Page.find_or_create_by(name: "landing", template: "landing_1", functionality: "order")
  test_page = Page.find_or_create_by(name: "test1", template: "test_1", functionality: "order")
  
  landing = pipe.add_page landing_page
  test1 = pipe.add_page test_page

  landing.update_attributes(title: "dev_landing", sequencer: 1)
  test1.update_attributes(title: "test1", sequencer: 2)

end