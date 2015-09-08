class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :set_user
  after_filter :reset_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper :all
  
  def set_user
    if current_user
      user_id = current_user
    else
      user_id = User.new
    end
    User.model_stamper  
    User.stamper = user_id
  end

  def set_csrf_cookie_for_ng
   cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
  
  def reset_user
    User.model_stamper
    User.reset_stamper
  end
  
  protected
  # In Rails 4.2 and above
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
end
