class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_order, :current_country, :current_locale, :set_session, :reset_session

  def set_session id
    puts "SET" 
    session[:current_order_id] = id unless session[:current_order_id].present?
  end

  def reset_session
    pr "RESET"
    session[:current_order_id] = nil
  end

  def current_order
    return @current_order if @current_order.present?
    if session[:current_order_id].present?
      @current_order ||= session[:current_order_id] && Order.find_by_id(session[:current_order_id])
    else
      @current_order = Order.new
    end
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

  def current_locale
    return I18n.locale.to_s.split("_").first
  end

  protected
    def require_http_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == "cspadmin" && password == ""
      end
    end
end
