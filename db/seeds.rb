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

q0001 = Question.find_or_create_by(identifier: "q0001")
q0002 = Question.find_or_create_by(identifier: "q0002")
q0003 = Question.find_or_create_by(identifier: "q0003")
q0004 = Question.find_or_create_by(identifier: "q0004")
q0005 = Question.find_or_create_by(identifier: "q0005")
q0006 = Question.find_or_create_by(identifier: "q0006")
q0007 = Question.find_or_create_by(identifier: "q0007")
q0008 = Question.find_or_create_by(identifier: "q0008")
q0009 = Question.find_or_create_by(identifier: "q0009")
q0010 = Question.find_or_create_by(identifier: "q0010")
q0011 = Question.find_or_create_by(identifier: "q0011")
q0012 = Question.find_or_create_by(identifier: "q0012")
q0013 = Question.find_or_create_by(identifier: "q0013")
q0014 = Question.find_or_create_by(identifier: "q0014")
q0015 = Question.find_or_create_by(identifier: "q0015")
q0016 = Question.find_or_create_by(identifier: "q0016")

q0001a1 = Answer.find_or_create_by(identifier: "q0001a1")
q0001a1.add_operation "apetite_morning"

q0001a2 = Answer.find_or_create_by(identifier: "q0001a2")
q0001a2.remove_operation "apetite_morning"

q0002a1 = Answer.find_or_create_by(identifier: "q0002a1")
q0002a1.add_operation "sweet"

q0002a2 = Answer.find_or_create_by(identifier: "q0002a2")
q0002a2.remove_operation "sweet"

q0003a1 = Answer.find_or_create_by(identifier: "q0003a1")
q0003a1.remove_operation "smoking"

q0003a2 = Answer.find_or_create_by(identifier: "q0003a2")
q0003a2.add_operation "smoking"

q0004a1 = Answer.find_or_create_by(identifier: "q0004a1")
q0004a1.remove_operation "cold"

q0004a2 = Answer.find_or_create_by(identifier: "q0004a2")
q0004a2.add_operation "cold"

q0005a1 = Answer.find_or_create_by(identifier: "q0005a1")
q0005a1.add_operation "stomack_bloat_rare"
q0005a1.remove_operation "stomack_bloat_medium"
q0005a1.remove_operation "stomack_bloat_often"

q0005a2 = Answer.find_or_create_by(identifier: "q0005a2")
q0005a2.remove_operation "stomack_bloat_rare"
q0005a2.add_operation "stomack_bloat_medium"
q0005a2.remove_operation "stomack_bloat_often"

q0005a3 = Answer.find_or_create_by(identifier: "q0005a3")
q0005a3.remove_operation "stomack_bloat_rare"
q0005a3.remove_operation "stomack_bloat_medium"
q0005a3.add_operation "stomack_bloat_often"

q0006a1 = Answer.find_or_create_by(identifier: "q0006a1")
q0006a1.add_operation "hormonal_contraception"

q0006a2 = Answer.find_or_create_by(identifier: "q0006a2")
q0006a2.remove_operation "hormonal_contraception"

q0007a1 = Answer.find_or_create_by(identifier: "q0007a1")
q0007a1.add_operation "tea"
q0007a1.remove_operation "coffee"

q0007a2 = Answer.find_or_create_by(identifier: "q0007a2")
q0007a2.remove_operation "tea"
q0007a2.add_operation "coffee"

q0008a1 = Answer.find_or_create_by(identifier: "q0008a1")
q0008a1.remove_operation "meal_after_1hour"

q0008a2 = Answer.find_or_create_by(identifier: "q0008a2")
q0008a2.add_operation "meal_after_1hour"

q0009a1 = Answer.find_or_create_by(identifier: "q0009a1")
q0009a1.add_operation "sleep_problems"

q0009a2 = Answer.find_or_create_by(identifier: "q0009a2")
q0009a2.remove_operation "sleep_problems"

q0010a1 = Answer.find_or_create_by(identifier: "q0010a1")
q0010a1.add_operation "meat"

q0010a2 = Answer.find_or_create_by(identifier: "q0010a2")
q0010a2.remove_operation "meat"

q0011a1 = Answer.find_or_create_by(identifier: "q0011a1")
q0011a1.add_operation "hiccups"

q0011a2 = Answer.find_or_create_by(identifier: "q0011a2")
q0011a2.remove_operation "hiccups"

q0012a1 = Answer.find_or_create_by(identifier: "q0012a1")
q0012a1.add_operation "children"
q0012a1.remove_operation "pregnant"

q0012a2 = Answer.find_or_create_by(identifier: "q0012a2")
q0012a2.remove_operation "children"
q0012a2.remove_operation "pregnant"

q0012a3 = Answer.find_or_create_by(identifier: "q0012a3")
q0012a3.remove_operation "children"
q0012a3.add_operation "pregnant"

q0013a1 = Answer.find_or_create_by(identifier: "q0013a1")
q0013a1.remove_operation "milk"

q0013a2 = Answer.find_or_create_by(identifier: "q0013a2")
q0013a2.add_operation "milk"

q0014a1 = Answer.find_or_create_by(identifier: "q0014a1")
q0014a1.add_operation "email_morning"

q0014a2 = Answer.find_or_create_by(identifier: "q0014a2")
q0014a2.remove_operation "email_morning"

q0015a1 = Answer.find_or_create_by(identifier: "q0015a1")
q0015a1.add_operation "bone_pain"

q0015a2 = Answer.find_or_create_by(identifier: "q0015a2")
q0015a2.add_operation "bone_pain"

q0016a1 = Answer.find_or_create_by(identifier: "q0016a1")
q0016a1.add_operation "alcohol"

q0016a2 = Answer.find_or_create_by(identifier: "q0016a2")
q0016a2.remove_operation "alcohol"

q0001.add_answer q0001a1
q0001.add_answer q0001a2
q0002.add_answer q0002a1
q0002.add_answer q0002a2
q0003.add_answer q0003a1
q0003.add_answer q0003a2
q0004.add_answer q0004a1
q0004.add_answer q0004a2
q0005.add_answer q0005a1
q0005.add_answer q0005a2
q0005.add_answer q0005a3
q0006.add_answer q0006a1
q0006.add_answer q0006a2
q0007.add_answer q0007a1
q0007.add_answer q0007a2
q0008.add_answer q0008a1
q0008.add_answer q0008a2
q0009.add_answer q0009a1
q0009.add_answer q0009a2
q0010.add_answer q0010a1
q0010.add_answer q0010a2
q0011.add_answer q0011a1
q0011.add_answer q0011a2
q0012.add_answer q0012a1
q0012.add_answer q0012a2
q0012.add_answer q0012a3
q0013.add_answer q0013a1
q0013.add_answer q0013a2
q0014.add_answer q0014a1
q0014.add_answer q0014a2
q0015.add_answer q0015a1
q0015.add_answer q0015a2
q0016.add_answer q0016a1
q0016.add_answer q0016a2

if Rails.env.development?
  f_intro = Page.find_or_create_by(name: "f_intro", template: "f_intro", functionality: "static")
  f_landing = Page.find_or_create_by(name: "f_landing", template: "f_landing", functionality: "order")
  f_test1 = Page.find_or_create_by(name: "f_test1", template: "f_test1", functionality: "order")
  f_test2 = Page.find_or_create_by(name: "f_test2", template: "f_test2", functionality: "order")
  f_test3 = Page.find_or_create_by(name: "f_test3", template: "f_test3", functionality: "order")
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

  checkout.add_chance_page chance
  checkout.add_fail_page checkout_retry
  checkout.add_success_page success
end