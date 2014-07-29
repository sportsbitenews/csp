unless Rails.env.test?
  ALLOWED_ORDER_DYNAMIC_VIRTUAL_ATTRIBUTES = [
    :name,
    :gender, 
    :age,
    :height,
    :weight
  ]
else
  ALLOWED_ORDER_DYNAMIC_VIRTUAL_ATTRIBUTES = [
    :custom_key1,
    :custom_key2,
    :custom_key3,
    :custom_key4,
    :custom_key5,
    :custom_key6,
    :data_key
  ]
end