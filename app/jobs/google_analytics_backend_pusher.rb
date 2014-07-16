require 'resque/errors'
require 'resque-loner'
require 'rest_client'

class GoogleAnalyticsBackendPusher
  include Resque::Plugins::UniqueJob
  @queue = :google_analytics_backend_pusher
  
  def self.add params
    if Rails.env.test?
      self.perform params
    else
      Resque.enqueue self, params
    end
  end

  def self.perform params
    begin
      s_params = params.stringify_keys
      trans_id = s_params["ti"] if s_params["ti"].present?
      RestClient.get('https://www.google-analytics.com/collect', params: s_params, timeout: @timeout, open_timeout: @open_timeout)
      log_analytics_data "sent", s_params, trans_id
    rescue  RestClient::Exception => rex
      log_analytics_data "failed", s_params, trans_id
    end
  end

  def self.log_analytics_data status, params, trans_id = nil
    params["tr"] = params["tr"].to_i if params["tr"].present?
    GoogleAnalytics.create!(status: status, category: params["t"], data: params.to_s, payment_id: trans_id)
  end
end