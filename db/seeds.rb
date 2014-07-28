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
  f_intro = Page.find_or_create_by(name: "intro", template: "f_intro", functionality: "static")
  f_landing = Page.find_or_create_by(name: "landing", template: "f_landing", functionality: "order")
  f_test1 = Page.find_or_create_by(name: "f_test1", template: "f_test_1", functionality: "order")
  f_test2 = Page.find_or_create_by(name: "f_test2", template: "f_test_2", functionality: "order")
  f_test3 = Page.find_or_create_by(name: "f_test3", template: "f_test_3", functionality: "order")
  f_results = Page.find_or_create_by(name: "f_results", template: "f_results", functionality: "static")
  f_checkout = Page.find_or_create_by(name: "f_checkout", template: "f_checkout", functionality: "checkout")
  f_last_chance = Page.find_or_create_by(name: "f_chance", template: "f_chance", functionality: "checkout")
  f_retry = Page.find_or_create_by(name: "f_retry", template: "f_retry", functionality: "checkout")
  f_success = Page.find_or_create_by(name: "f_success", template: "f_success", functionality: "success")

  pipe = Pipeline.find_or_create_by(locale: "lv", status: "active", serial: "1", group: "norden", main: true, country: Country.get_main)

  intro = pipe.add_page f_intro
  landing = pipe.add_page f_landing
  test1 = pipe.add_page f_test1
  test2 = pipe.add_page f_test2
  test3 = pipe.add_page f_test3
  results = pipe.add_page f_results
  checkout = pipe.add_page f_checkout
  chance = pipe.add_page f_last_chance
  checkout_retry = pipe.add_page f_retry
  success = pipe.add_page f_success

  intro.update_attributes(title: "intro", sequencer: 1)
  landing.update_attributes(title: "landing", sequencer: 2)
  test1.update_attributes(title: "test1", sequencer: 3)
  test2.update_attributes(title: "test2", sequencer: 4)
  test3.update_attributes(title: "test3", sequencer: 5)
  results.update_attributes(title: "results", sequencer: 6)
  checkout.update_attributes(title: "checkout", sequencer: 7)
  chance.update_attributes(title: "last-chance")
  checkout_retry.update_attributes(title: "checkout-retry")
  success.update_attributes(title: "success")
end