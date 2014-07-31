IMPERIAL_SYSTEM_COUNTRY_CODES = ["us", "cb"]

if Rails.env.development?
  PAYMENT_PROTOCOL = "http"
elsif Rails.env.staging?
  PAYMENT_PROTOCOL = "http"
else
  PAYMENT_PROTOCOL = "https"
end