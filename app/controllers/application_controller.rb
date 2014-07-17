class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order, :current_country, :current_locale

  def current_order
    return @current_order if @current_order.present?
    @current_order ||= session[:current_order_id] && Order.find_by_id(session[:current_order_id])
    return @current_order
  end

  def current_country
    @current_country = Country.find_by(code: "lv")

    if params[:country] && (params[:country].is_a? String)
      @current_country = Country.find_by_code(params[:country])
    else
      begin
        country = Country.find_by(code: request.location.country_code.downcase) if request.location
        if country.present?
          @current_country = country
        else
          @current_country = Country.get_main
        end
      rescue
        @current_country = Country.get_main
      end
    end
    @current_country = Country.get_main unless @current_country.present?
    return @current_country
  end

  def current_language_code
    return I18n.locale.to_s.split("_").first
  end

  protected
    def require_http_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == "cspadmin" && password == ""
      end
    end
end
