require "pp-adaptive"

class Pay::PaypalController < PayController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :json, :xml
  layout false
  before_filter :init_client

  def new
    return_path = "#{PAYMENT_PROTOCOL}://#{request.host_with_port}#{success_pay_paypal_index_path}"
    cancel_path = "#{PAYMENT_PROTOCOL}://#{request.host_with_port}#{cancel_pay_paypal_index_path}"
    ipn_notification_url = "#{PAYMENT_PROTOCOL}://#{request.host_with_port}#{pay_paypal_index_path}"

    receiver = PAYPAL_RECEIVER
    amount = "0.01"
    currency = "EUR"

    @client.execute(:Pay,
        :action_type     => "PAY",
        :receiver_email  => receiver,
        :receiver_amount => amount,
        :currency_code   => currency,
        :cancel_url      => cancel_path,
        :return_url      => return_path,
        :ipn_notification_url => ipn_notification_url
    ) do |response|
      if response.success?
        pr response.inspect
        redirect_to @client.payment_url(response)
        pr params.inspect
      else
        render :json => response
      end
    end
  end

  def create
    render :text => "ok"
  end

  def success
    current_order.process_complete
    redirect_to page_path(current_order.pipeline_page.success_pipeline_page.redirect_to_page_params)
    pr params.inspect
  end

  def cancel
    redirect_to page_path(current_order.pipeline_page.fail_pipeline_page.redirect_to_page_params)
  end

  private
    def init_client
      @client = AdaptivePayments::Client.new(
        :user_id       => PAYPAL_USERNAME,
        :password      => PAYPAL_PASSWORD,
        :signature     => PAYPAL_SIGNATURE,
        :app_id        => PAYPAL_APP_ID,
        :sandbox       => PAYPAL_SANDBOX
      )
    end
end